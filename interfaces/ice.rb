require 'timeout'
require 'benchmark'
require 'Glacier2'
require File.join(File.expand_path(File.dirname(__FILE__)), "..", "vendor", "ice", "Murmur.rb")
module Murmur
	module Ice
		class ::InvalidMetaException < Exception; end
		class ::Murmur::Ice::InvalidServerException < Exception; end
		class Meta
			def initialize(glacierHost = nil, glacierPort = nil, user = nil, pass = nil, host = "127.0.0.1", port = "6502", icesecret = nil)
				ic = nil
				if icesecret and icesecret != ""
					props = ::Ice::createProperties
					props.setProperty "Ice.ImplicitContext", "Shared"
					idd = ::Ice::InitializationData.new
					idd.properties = props
					ic = ::Ice::initialize idd
					ic.getImplicitContext.put("secret", icesecret)
				else
					ic = ::Ice::initialize
				end
				
				if glacierHost and glacierHost != "" then
					@glacierHost = glacierHost
					@glacierPort = glacierPort
					validate_connection(glacierHost, glacierPort)
					prx = ic.stringToProxy("Glacier2/router:tcp -h #{glacierHost} -p #{glacierPort}")
					@router = ::Glacier2::RouterPrx::uncheckedCast(prx).ice_router(nil)
					@session = @router.createSession(user, pass)
				end
				
				conn = "tcp -h #{host} -p #{port}"
				@meta = add_proxy_router(Murmur::MetaPrx::checkedCast(ic.stringToProxy("Meta:#{conn}")))
				raise "Invalid proxy" unless @meta
				
				@servers = {}
			end
			
			def destroy
				begin
					@router.destroySession @session
				rescue Ice::ConnectionLostException
					# Expected - Ice raises this when the connection is terminated. Yay for exceptions as flow control?
				end
				return nil
			end
			
			def add_proxy_router(prx)
				@router ? prx.ice_router(@router) : prx
			end
			
			def get_server(id)
				@servers[id] ||= Server.new(self, @meta, id)
			end
			
			def uncache_server(id)
				@servers[id] = nil
			end
			
			def list_servers(only_booted = false)
				method = only_booted ? :getBootedServers : :getAllServers
				@meta.send(method).collect do |server|
					server = add_proxy_router(server)
					@servers[server.id] ||= Server.new(self, @meta, nil, server)
				end					
			end
				
			def validate
				@meta.getVersion
				return true
			end
			
			def new_server(port = nil)
				server = @meta.newServer
				@servers[server.id] = Server.new(self, @meta, nil, add_proxy_router(server))
			end	
			
			def method_missing(method, *args)
				method = method.to_s
				method.gsub!(/_([a-z])/) { $1.upcase }
				@meta.send method, *args
			end
			
			def validate_connection(host, port)
				Timeout::timeout(2) do
					begin
						s = TCPSocket.new(host, port)
						s.close
					rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
						raise InvalidMetaException
					end						
				end
			rescue Timeout::Error
				raise InvalidMetaException
			end
		end			
		
		class Server
			def initialize(host, meta, id = nil, interface = nil)
				@meta = meta
				@host = host
				if id.nil? and interface.nil? then
					raise "Must pass either a server ID or a server interface instance"
				end
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
				@config = @meta.getDefaultConf.merge(@interface.getAllConf)
			end
			
			def destroy!
				@interface.stop if running?
				@host.uncache_server @interface.id
				@interface.delete
			end
			alias :delete :destroy!
			
			def restart!
				@interface.stop if running?
				@interface.start
				@running = nil
			end
			
			def [](key)
				config[key]
			end
			
			def []=(key, val)
				@interface.setConf(key, val.to_s)
				@config = nil
			end
			
			def setConf(key, val)
				self[key] = val
			end
			
			def method_missing(method, *args)
				method = method.to_s
				method.gsub!(/_([a-z])/) { $1.upcase }
				ret = @interface.send method, *args
			end
		end
	end
end