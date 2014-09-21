class ChatController < WebsocketRails::BaseController
  #before_action make_private_channel, only:[:create_miner, :set_miner]

  def new_message
    puts message

    curr_message=message.dup
    MessageStore.messages ||=Array.new
    MessageStore.messages<<curr_message[:msg_body]
    #session[:messages]||=Array.new
    #session[:messages]<<curr_message

    #redirect_to public_new_message_path

    #trigger_success curr_message
    WebsocketRails[:user_1_miner_1].trigger :new_message, curr_message
    #WebsocketRails[:chat].trigger :new_message, curr_message
  end

  def send_message

  end

  def create_miner

  end

  def set_miner

  end

  def authorize_user
    make_private_channel 1,1
    logger.info 'authorize_user'
    if message[:user_id]=='1' && message[:password]=='password'
      logger.info "authorize_user success with user_id #{message[:user_id]}"
      trigger_success message
    else
      logger.info "authorize_user failure with user_id #{message[:user_id]}"
      trigger_failure message
    end
  end

  private

  def make_private_channel(user_id, miner_id)
    #TODO uncomment below for real app
    #WebsocketRails["#{user_id}_#{miner_id}"].make_private
    WebsocketRails["user_#{user_id}_miner_#{miner_id}"].make_private
  end
end