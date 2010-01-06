require 'vendor/ice/Murmur.rb'
module Murmur
	module Ice
		class Meta
			def initialize(host = "127.0.0.1", port = "6502")
				ic = ::Ice::initialize
				conn = "tcp -h #{host} -p #{port}"
				@meta = Murmur::MetaPrx::checkedCast(ic.stringToProxy("Meta:#{conn}"))
				raise "Invalid proxy" unless @meta
				
				@servers = {}
			end
			
			def get_server(id)
				@servers[id] ||= Server.new(@meta, id)
			end
			
			def list_servers(only_booted = false)
				method = only_booted ? :getBootedServers : :getAllServers
				@meta.send(method).collect do |server|
					@servers[server.id] = Server.new(@meta, nil, server)
				end
			end
			
			def new_server(port = nil)
				server = @meta.newServer
				@servers[server.id] = Server.new(@meta, nil, server)
			end			
		end			
		
		class Server
			def initialize(meta, id = nil, interface = nil)
				@meta = meta
				if id.nil? and interface.nil? then
					raise "Must pass either a server ID or a server interface instance"
				end
				@interface = interface || @meta.getServer(id)
			end
			
			def id
				@interface.id
			end
			
			def running?
				@interface.isRunning
			end
			
			def config
				@meta.getDefaultConf.merge(@interface.getAllConf)
			end
			
			def destroy!
				@interface.stop if running?
				@interface.delete
			end
			
			def restart!
				@interface.stop! if running?
				@interface.start!
			end
			
			def [](key)
				@interface.getConf(key) || @meta.getDefaultConf[key]
			end
			
			def []=(key, val)
				@interface.setConf(key, val)
			end
			
			def method_missing(method, *args)
				@interface.send method, *args
			end
		end
	end
end