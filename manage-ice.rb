require 'interfaces/ice'
require 'helpers'

@meta = Murmur::Ice::Meta.new
class UnknownCommandException < Exception; end

def server_command(id, command = nil, *args)
	server = @meta.get_server(id)
	case command
	when "set"
		key = args.shift
		val = args.join " "
		server[key] = val
		server.restart!
	when "start"
		server.start
	when "stop"
		server.stop
	when "restart"
		server.restart!
	when "destroy"
		server.destroy!
	when "supw"
		pw = args.shift
		raise "Cannot set a blank superuser password" if pw.nil? or pw == ""
		server.setSuperuserPassword(pw)
		server.restart!
	when "", "config", nil
		server.config.each do |key, val|
			pt key, val.split("\n").first
		end
	else
		raise UnknownCommandException 
	end
end

def meta_command(command = nil, *args)
	case command
	when "list"
		pt "Server ID", "Running", 2
		pt "---------", "------", 2
		
		@meta.list_servers.each do |server|
			pt server.id, server.isRunning, 2
		end
	when "new"
		port = args.first
		port = nil if !port.nil? and port.to_i == 0
		@meta.new_server(port)
	else
		raise UnknownCommandException 
	end
end

begin
	if (ARGV[0] || 0).to_i != 0 then
		server_command(*ARGV)
	else
		meta_command(*ARGV)
	end
rescue UnknownCommandException
	help
end
