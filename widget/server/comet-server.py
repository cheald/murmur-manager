# I chose to implement the Comet driver in Python rather than Ruby because...the Ruby ICE bindings don't support callbacks. Blurg.
# Mostly adapted from http://mumble.git.sourceforge.net/git/gitweb.cgi?p=mumble/mumble;a=blob_plain;f=scripts/testcallback.py;hb=HEAD
#
# Implements a simple callback responder, designed to forward events as JSON objects to a HTTP push responder.
# Expects a single endpoint: /murmur/send?id=murmursrv$id, with which to post events for broadcast to.
# 
# I use nginx with the nginx_http_push_module plugin to make nginx serve as an HTTP push server.

import Ice, sys, httplib, json

Ice.loadSlice('../../vendor/ice/Murmur.ice')
import Murmur

httpconn = False
HOST = "guildofguilds.org"

class MetaCallbackI(Murmur.MetaCallback):
	def started(self, s, current=None):
		serverR = Murmur.ServerCallbackPrx.uncheckedCast(adapter.addWithUUID(ServerCallbackI(server, current.adapter)))
		s.addCallback(serverR)

	def stopped(self, s, current=None):
		pass

class ServerCallbackI(Murmur.ServerCallback):
	lastStr = None
	
	def __init__(self, server, adapter):
		self.server = server
	
	def push_user(self, user, state = "online"):
		state = {
			"type": "player",
			"name": user.name,
			"channel": user.channel,
			"mute": user.mute or user.selfMute or user.suppress,
			"deaf": user.deaf or user.selfDeaf,
			"online": user.onlinesecs,
			"state": state
		}
		self.push(state)
		
	def push_channel(self, channel, state = "permanent"):
		state = {
			"type": "channel",
			"id": channel.id,
			"name": channel.name,
			"parent": channel.parent,
			"position": channel.position,
			"state": state
		}
		self.push(state)
		
	def push(self, dict):
		str = "(%s)" % json.write(dict)
		if self.lastStr == str: return
		self.lastStr = str
		channel = "murmursrv%d" % self.server.id()
		print "Sending %s to %s" % (str, channel)
		httpconn.request("POST", "/murmur/send?id=%s" % channel, str, {"Host": HOST})
		response = httpconn.getresponse()
		httpconn.close()
		status, reason, body = response.status, response.reason, response.read()
		return status >= 202 and status < 300

	def userConnected(self, p, current=None):
		self.push_user(p)

	def userDisconnected(self, p, current=None):
		self.push_user(p, "offline")

	def userStateChanged(self, p, current=None):
		self.push_user(p)

	def channelCreated(self, c, current=None):
		self.push_channel(c)

	def channelRemoved(self, c, current=None):
		self.push_channel(c, "removed")

	def channelStateChanged(self, c, current=None):
		self.push_channel(c)
		
if __name__ == "__main__":
	ice = Ice.initialize(sys.argv)
	meta = Murmur.MetaPrx.checkedCast(ice.stringToProxy('Meta:tcp -h 127.0.0.1 -p 6502'))
	adapter = ice.createObjectAdapterWithEndpoints("Callback.Client", "tcp -h 127.0.0.1")
	adapter.activate()
	for server in meta.getBootedServers():
		serverR = Murmur.ServerCallbackPrx.uncheckedCast(adapter.addWithUUID(ServerCallbackI(server, adapter)))
		server.addCallback(serverR)
		
	httpconn = httplib.HTTPConnection('localhost')
		
	try:
		ice.waitForShutdown()
	except KeyboardInterrupt:
		print 'Interrupt caught, exiting'

	httpconn.close()
	ice.shutdown()