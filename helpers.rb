def print_tabbed(key, val, tabs = 5)
	key = key.to_s
	val = val.to_s
	puts sprintf("%s%s%s", key, "\t" * (tabs - (key.length / 8).ceil), val.to_s)
end
alias pt print_tabbed

def help
	puts "Usage: manager.rb [opts]"
	puts ""
	pt "Args", "Effect"
	pt "----", "------"
	pt "[server-id] config", "List a server's config"
	pt "[server-id] set [key] [val]", "Set a server's config value"
	pt "[server-id] start", "Start a server"
	pt "[server-id] stop", "Stop a server"
	pt "[server-id] restart", "Restart a server. Will just start it if not already running."
	pt "[server-id] destroy", "Permanently destroy a server"
	pt "[server-id] supw [password]", "Set superuser password for this server"
	pt "new", "Create a new server"
	pt "list", "List existing servers"
end