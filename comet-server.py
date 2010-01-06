# I chose to implement the Comet driver in Python rather than Ruby because...the Ruby ICE bindings don't support callbacks. Blurg.
# Mostly adapted from http://mumble.git.sourceforge.net/git/gitweb.cgi?p=mumble/mumble;a=blob_plain;f=scripts/testcallback.py;hb=HEAD

import Ice, sys, httplib

Ice.loadSlice('vendor/ice/Murmur.ice')
import Murmur

class MetaCallbackI(Murmur.MetaCallback):
	def started(self, s, current=None):
		serverR = Murmur.ServerCallbackPrx.uncheckedCast(adapter.addWithUUID(ServerCallbackI(server, current.adapter)))
		s.addCallback(serverR)

	def stopped(self, s, current=None):
		pass

class ServerCallbackI(Murmur.ServerCallback):
	def __init__(self, server, adapter):
		self.server = server
		self.contextR=Murmur.ServerContextCallbackPrx.uncheckedCast(adapter.addWithUUID(ServerContextCallbackI(server)))

	def userConnected(self, p, current=None):
		print "connected"
		print p
		self.server.addContextCallback(p.session, "flubber", "Power up the T", self.contextR, Murmur.ContextChannel | Murmur.ContextUser)
		if (self.server.hasPermission(p.session, 0, Murmur.PermissionWrite)):
			print "Is a global admin"

	def userDisconnected(self, p, current=None):
		print "disconnected"
		print p

	def userStateChanged(self, p, current=None):
		print "stateChanged"
		print self.server
		print p

	def channelCreated(self, c, current=None):
		print "created"
		print c

	def channelRemoved(self, c, current=None):
		print "removed"
		print c

	def channelStateChanged(self, c, current=None):
		print "stateChanged"
		print c
		
if __name__ == "__main__":
	ice = Ice.initialize(sys.argv)
	meta = Murmur.MetaPrx.checkedCast(ice.stringToProxy('Meta:tcp -h 127.0.0.1 -p 6502'))
	adapter = ice.createObjectAdapterWithEndpoints("Callback.Client", "tcp -h 127.0.0.1")
	adapter.activate()
	for server in meta.getBootedServers():
		serverR = Murmur.ServerCallbackPrx.uncheckedCast(adapter.addWithUUID(ServerCallbackI(server, adapter)))
		server.addCallback(serverR)
		
    try:
        ice.waitForShutdown()
    except KeyboardInterrupt:
		print 'Interrupt caught, exiting'

    meta.removeCallback(metaR)
    ice.shutdown()
		