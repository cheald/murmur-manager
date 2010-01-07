require 'sinatra'
require 'interfaces/ice'
require 'json'

get "/:id" do
	@meta = Murmur::Ice::Meta.new
	server = @meta.get_server(params[:id].to_i)
	content_type "text/javascript"
	
	channels, users = [], []
	rname = server["registername"]
	server.get_channels.each do |key, channel|
		channelName = channel.id == 0 ? rname : channel.name	
		channels.push({
			:name => channelName || channel.name,
			:id => channel.id,
			:parent => channel.parent,
			:position => channel.position,
			:state => channel.temporary ? "temporary" : "permanent"
		})
	end
	server.get_users.each do |key, user|
		users.push({
			:name => user.name,
			:channel => user.channel,
			:mute => user.mute || user.selfMute || user.suppress,
			:deaf => user.deaf || user.selfDeaf,
			:online => user.onlinesecs,
			:state => "online"
		})
	end
	
	val = JSON.generate({:channels => channels, :users => users})
	cb = params[:jsonp] || params[:callback] || ""
	"#{cb}(#{val})"
end
