class AuthorizationController < WebsocketRails::BaseController
  def authorize_channels
    # The channel name will be passed inside the message Hash
    #channel = WebsocketRails[message[:channel]]

    channel_name= message[:channel]
    #TODO uncomment below when use CanCan gem
    #if can? :subscribe, channel
    if channel_name =='user_1_miner_1'
      accept_channel 'user_1'
    else
      deny_channel({:message => 'authorization failed!'})
    end
  end
end