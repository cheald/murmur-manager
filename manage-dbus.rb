#!/bin/env ruby
require 'interfaces/dbus'
require 'helpers'

# DBus works with less overhead, but doesn't support remote management via Glacier2, or any of the newer stuff. Use Ice where possible.

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
  case cmd
  when "set"
    key = args.shift
    val = args.join(" ")
    server[key] = val
    puts "Server ID #{server.id}: #{key} set to #{val}"
    server.restart!
    puts "Server restarted"
  when "start"
    server.start!
  when "stop"
    server.stop!
  when "supw"
    pw = args.shift
    raise "Cannot set a blank superuser password" if pw.nil? or pw == ""
    server["superuser_password"] = pw
  when "restart"
    server.restart!
  when "destroy"
    server.destroy!
  when "", "config", nil
    print_options server
  else
    raise UnknownCommandException
  end
end

def meta_command(command, *args)
  case command
  when "list"
    pt "Server ID", "Running", 2
    pt "---------", "------", 2
    $manager.list_servers.each do |serverID|
      server = $manager.get_server(serverID)
      pt serverID, server.running?, 2
    end
  when "new"
    server = $manager.create_server
    puts "\nServer created. New ID is #{server.id}\n\nServer config:\n-------------\n"
    print_options server
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