require 'interfaces/ice'
require 'helpers'

@meta = Murmur::Ice::Meta.new
class UnknownCommandException < Exception; end

def server_command(id, command, *args)
	puts "ID is #{id}"
	server = @meta.get_server(id)
	case command
	when "set"
		key = args.shift
		val = args.join " "
		server[key] = val
	when "start"
		server.start
	when "stop"
		server.stop
	when "restart"
		server.restart!
	when "destroy"
		server.destroy!
	when "", nil
		server.config.each do |key, val|
			pt key, val.split("\n").first
		end
	else
		raise UnknownCommandException 
	end
end

def meta_command(command, *args)
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
	cmd_or_server_id = ARGV[0]
	if cmd_or_server_id and cmd_or_server_id.to_i > 0 then
		server_command(cmd_or_server_id, ARGV[1], *ARGV[2..-1])
	else
		meta_command(cmd_or_server_id, *ARGV[1..-1])
	end
rescue UnknownCommandException
	help
end
