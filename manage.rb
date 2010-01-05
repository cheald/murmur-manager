#!/usr/bin/env ruby
require 'murmur-interface'

def print_tabbed(key, val, tabs = 5)
	key = key.to_s
	val = val.to_s
	puts sprintf("%s%s%s", key, "\t" * (tabs - (key.length / 8).ceil), val.to_s)
end
alias pt print_tabbed

def print_options(server)
	server.get_config.each do |key, val|
		if %w"key certificate".include? key then
			val = val.gsub(/[\r\n]/, "")[0..32] + "..."
		end
		pt(key, val)
	end
end

def help
	puts "Usage: manager.rb [opts]"
	puts ""
	pt "Args", "Effect"
	pt "----", "------"
	pt "[server-id]", "List a server's config"
	pt "[server-id] set [key] [val]", "Set a server's config value"
	pt "[server-id] start", "Start a server"
	pt "[server-id] stop", "Stop a server"
	pt "[server-id] destroy", "Permanently destroy a server"
	pt "new", "Create a new server"
	pt "list", "List existing servers"
end

manager = MurmurManager.new
cmd_or_server_id = ARGV[0]
if ARGV.empty? or cmd_or_server_id == nil or cmd_or_server_id == "" then
	help
elsif cmd_or_server_id == "list" then
	pt "Server ID", "Running", 2
	pt "---------", "------", 2
	manager.list_servers.each do |serverID|		
		server = manager.get_server(serverID)
		pt serverID, server.running?, 2
	end	
elsif cmd_or_server_id.to_i != 0 then
	cmd = ARGV[1]
	server = manager.get_server(cmd_or_server_id)
	if cmd.nil? then
		print_options(server)
	elsif cmd == "set" then
		val = ARGV[3..-1].join(" ")
		server[ARGV[2]] = val
		puts "Server ID #{server.id}: #{ARGV[2]} set to #{val}"
		server.restart!
		puts "Server restarted"
	elsif cmd == "start" then
		server.start!
	elsif cmd == "stop" then
		server.stop!
	elsif cmd == "destroy" then
		server.destroy!
	else
		puts "Unknown command"
	end
elsif cmd_or_server_id == "new"
	server = manager.create_server
	puts "\nServer created. New ID is #{server.id}\n\nServer config:\n-------------\n"
	print_options server
else
	help
end