#!/usr/bin/env ruby
require 'interfaces/dbus'
require 'helpers'

$manager = Murmur::DBus::Manager.new
class UnknownCommandException < Exception; end

def print_options(server)
	server.get_config.each do |key, val|
		if %w"key certificate".include? key then
			val = val.gsub(/[\r\n]/, "")[0..32] + "..."
		end
		pt(key, val)
	end
end

def server_command(id, cmd, *args)
	server = $manager.get_server(id)
	if cmd.nil? then
		print_options(server)
	elsif cmd == "set" then
		key = args.shift
		val = args.join(" ")
		server[key] = val
		puts "Server ID #{server.id}: #{key} set to #{val}"
		server.restart!
		puts "Server restarted"
	elsif cmd == "start" then
		server.start!
	elsif cmd == "stop" then
		server.stop!
	elsif cmd == "restart" then
		server.restart!
	elsif cmd == "destroy" then
		server.destroy!
	else
		raise UnknownCommandException
	end
end

def meta_command(command, *args)
	if command == "list" then
		pt "Server ID", "Running", 2
		pt "---------", "------", 2
		$manager.list_servers.each do |serverID|		
			server = $manager.get_server(serverID)
			pt serverID, server.running?, 2
		end	
	elsif command == "new" then
		server = $manager.create_server
		puts "\nServer created. New ID is #{server.id}\n\nServer config:\n-------------\n"
		print_options server
	else
		raise UnknownCommandException
	end
end

begin
	cmd_or_server_id = ARGV[0]
	if ARGV.empty? or cmd_or_server_id == nil or cmd_or_server_id == "" then
		help
	elsif cmd_or_server_id.to_i != 0 then
		server_command(cmd_or_server_id, ARGV[1], *ARGV[2..-1])
	else
		meta_command(cmd_or_server_id, *ARGV[1..-1])
	end
rescue UnknownCommandException
	help
end