def print_block
  @lines = []
  @colsizes = {}
  yield
  @lines.each do |line|
    b = ""
    line.length.times do |i|
      b << "%-#{@colsizes[i]+8}s"
    end
    puts b % line
  end
end

def line(*args)
  args.each_with_index do |arg, index|
    arg = arg.to_s unless arg.is_a? String
    @colsizes[index] = arg.length if @colsizes[index].nil? or arg.length > @colsizes[index]
  end
  @lines << args
end

def help
  print_block do
    line "Usage: manager.rb [opts]"
    line "Args", "Effect"
    line "----", "------"
    line "[server-id] config", "List a server's config"
    line "[server-id] set [key] [val]", "Set a server's config value"
    line "[server-id] start", "Start a server"
    line "[server-id] stop", "Stop a server"
    line "[server-id] restart", "Restart a server. Will just start it if not already running."
    line "[server-id] destroy", "Permanently destroy a server"
    line "[server-id] supw [password]", "Set superuser password for this server"
    line "new", "Create a new server"
    line "list", "List existing servers"
  end
end