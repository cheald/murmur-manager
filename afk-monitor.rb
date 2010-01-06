require 'rubygems'
require 'daemons'
require 'interfaces/ice'

IDLE_NAMES = %w"afk idle"		# The first channel matching any of these names will be the catch-all idle channel
IDLE_TIMEOUT = 7200				# Move people to the AFK channel after two hours

daemon_options = {
  :multiple => false,
  :dir_mode => :normal,
  :dir => ".",
  :backtrace => true
}
 
Daemons.run_proc('murmur-afk-monitor', daemon_options) do
	while true do
		@meta = Murmur::Ice::Meta.new
		@meta.list_servers(true).each do |server|
			afk_channel = nil
			server.get_channels.each do |key, channel|
				if IDLE_NAMES.include? channel.name.downcase then
					afk_channel = channel.id
					break
				end
			end
			next if afk_channel.nil?
			
			server.get_users.each do |id, user|
				if user.idlesecs > IDLE_TIMEOUT then
					if user.channel != afk_channel then
						user.channel = afk_channel
						server.set_state(user)
					end
				end
			end
		end
		sleep(60)
	end
end