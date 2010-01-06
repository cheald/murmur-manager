require 'rubygems'
require 'daemons'
require 'interfaces/ice'

IDLE_NAMES = %w"afk idle"		# The first channel matching any of these names will be the catch-all idle channel
IDLE_TIMEOUT = 3600				# Move people to the AFK channel after one hour1

daemon_options = {
  :multiple => false,
  :dir_mode => :normal,
  :dir => ".",
  :backtrace => true
}
 
Daemons.run_proc('murmur-afk-monitor', daemon_options) do
	@meta = Murmur::Ice::Meta.new
	while true do
		channel_min_times = {}
		@meta.list_servers(true).each do |server|
			afk_channel = nil
			server.get_channels.each do |key, channel|
				if IDLE_NAMES.include? channel.name.downcase then
					afk_channel = channel.id
					break
				end
			end
			next if afk_channel.nil?
			
			users = server.get_users
			users.each do |id, user|
				channel_min_times = channel_min_times[user.channel] and channel_min_times[user.channel] < user.idlesecs ? channel_min_times[user.channel] : user.idlesecs
			end
			users.each do |id, user|
				if user.channel != afk_channel and user.idlesecs > IDLE_TIMEOUT and channel_min_times[user.channel] > IDLE_TIMEOUT then
					user.channel = afk_channel
					server.set_state(user)
				end
			end
		end
		sleep(60)
	end
end