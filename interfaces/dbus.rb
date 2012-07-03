$: << File.join(File.expand_path(File.dirname(File.dirname(__FILE__))), "vendor", "dbus", "lib")
require 'dbus'
module Murmur
  module DBus
    class Server
      attr_reader :id

      def initialize(interface, id)
        @interface = interface
        @id = id
      end

      def get_config
        config = @interface.getDefaultConf.first
        @config = config.merge(@interface.getAllConf(id).first)
      end

      def [](key)
        @interface.setConf(id, key) || get_config[key]
      end

      def []=(key, val)
        if key == "superuser_password" then
          set_superuser_password(val)
          return true
        else
          @interface.setConf(id, key.to_s, val.to_s)
          get_config
        end
      end

      def stop!
        @interface.stop(id)
      end

      def running?
        @running = @interface.isBooted(id).first
      end

      def start!
        @interface.start(id)
      end

      def restart!
        stop! if running?
        start!
      end

      def set_superuser_password(password)
        raise "Please specify a password" if password.nil? or password == ""
        @interface.setSuperUserPassword(id, password)
      end

      def destroy!
        stop! if running?
        @interface.deleteServer(id)
      end

      def method_missing(method, *args)
        @interface.send(method, id, *args).first
      end
    end

    class Manager
      def initialize
        @servers = {}
        @bus = ::DBus::SystemBus.instance
        @service = @bus.service "net.sourceforge.mumble.murmur"
        @object = @service.object "/"
        @object.introspect
        @interface = @object["net.sourceforge.mumble.Meta"]
      end

      def get_server(id)
        id = id.to_i
        raise "Invalid ID" if id < 1
        @servers[id] ||= Server.new(@interface, id)
      end

      def list_servers(all = true)
        method = all ? :getAllServers : :getBootedServers
        @interface.send(method).first
      end

      def create_server(port = nil)
        id = @interface.newServer.first
        server = get_server(id)
        if port then
          server["port"] = port
        end
        return server
      end

      def stop_server(server_id)
      end

      def introspect
        @object.introspect
      end
    end
  end
end