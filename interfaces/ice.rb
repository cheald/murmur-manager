require 'Glacier2'
require File.join(File.expand_path(File.dirname(__FILE__)), "..", "vendor", "ice", "Murmur.rb")
module Murmur
	module Ice
		class ::Murmur::Ice::InvalidServerException < Exception; end
		class Meta
			def initialize(glacierHost = nil, glacierPort = nil, user = nil, pass = nil, host = "127.0.0.1", port = "6502")

				ic = ::Ice::initialize
				
				if glacierHost then
					RAILS_DEFAULT_LOGGER.debug "Initializing Glacier routing: #{glacierHost}"
					prx = ic.stringToProxy("Glacier2/router:tcp -h #{glacierHost} -p #{glacierPort}")
					@router = ::Glacier2::RouterPrx::uncheckedCast(prx).ice_router(nil)
					puts user, pass
					@router.createSession(user, pass)
				end
				
				conn = "tcp -h #{host} -p #{port}"
				@meta = add_proxy_router(Murmur::MetaPrx::checkedCast(ic.stringToProxy("Meta:#{conn}")))
				raise "Invalid proxy" unless @meta
				
				@servers = {}
			end
			
			def add_proxy_router(prx)
				@router ? prx.ice_router(@router) : prx
			end
			
			def get_server(id)
				@servers[id] ||= Server.new(self, @meta, id)
			end
			
			def list_servers(only_booted = false)
				method = only_booted ? :getBootedServers : :getAllServers
				@meta.send(method).collect do |server|					
					@servers[server.id] ||= Server.new(self, @meta, nil, add_proxy_router(server))
				end
			end
			
			def new_server(port = nil)
				RAILS_DEFAULT_LOGGER.debug "!!! WARNING !!! Allocated Server"
				server = @meta.newServer
				@servers[server.id] = Server.new(self, @meta, nil, add_proxy_router(server))
			end	
			
			def method_missing(method, *args)
				method = method.to_s
				method.gsub!(/_([a-z])/) { $1.upcase }
				@meta.send method, *args
			end
		end			
		
		class Server
			def initialize(host, meta, id = nil, interface = nil)
				@meta = meta
				if id.nil? and interface.nil? then
					raise "Must pass either a server ID or a server interface instance"
				end
				RAILS_DEFAULT_LOGGER.debug "!!! WARNING !!! Initialized Server"
				@interface = interface || begin
					server = @meta.getServer(id)
					raise ::Murmur::Ice::InvalidServerException if server.nil?
					host.add_proxy_router(server)
				end
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
				@interface.stop if running?
				@interface.start
			end
			
			def [](key)
				config[key]
			end
			
			def []=(key, val)
				@interface.setConf(key, val.to_s)
			end
			
			def method_missing(method, *args)
				method = method.to_s
				method.gsub!(/_([a-z])/) { $1.upcase }
				@interface.send method, *args
			end
		end
	end
end