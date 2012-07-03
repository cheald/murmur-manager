#!/bin/env ruby
BASE = File.expand_path(File.dirname(__FILE__))
require File.join(BASE, "interfaces", "ice.rb")
require File.join(BASE, 'helpers')
require 'yaml'

class UnknownCommandException < Exception; end

def server_command(meta, id, command = nil, *args)
  server = meta.get_server(id)
  case command
  when "set"
    key = args.shift
    val = args.join " "
    server[key] = val
    puts "Set #{key} = #{val}"
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
  when "", "config", nil
    print_block do
      server.config.each do |key, val|
        line key, val.split("\n").first
      end
    end
  else
    raise UnknownCommandException
  end
end

def meta_command(meta, command = nil, *args)
  case command
  when "list"
    print_block do
      line "Server ID", "Name", "Running"
      line "---------", "----", "-------"
      meta.list_servers.each do |server|
        line server.id, server.config["registername"], server.isRunning
      end
    end

  when "new"
    port = args.first
    port = nil if !port.nil? and port.to_i == 0
    server = meta.new_server(port)
    puts "New server: ID #{server.id} added"
  else
    raise UnknownCommandException
  end
end

begin
  opts = YAML::load(open('options.yml').read)
  meta = Murmur::Ice::Meta.new opts
  # For a Glacier2 connection:
  # meta = Murmur::Ice::Meta.new "host.com", 4063, "user", "pass"

  if (ARGV[0] || 0).to_i != 0 then
    server_command(meta, *ARGV)
  else
    meta_command(meta, *ARGV)
  end
rescue UnknownCommandException
  help
end
