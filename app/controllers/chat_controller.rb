class ChatController < WebsocketRails::BaseController
  def new_message
    curr_message=message[:msg_body].dup
    session[:messages]||=Array.new
    session[:messages]<<curr_message
    trigger_success curr_message
    #redirect_to public_new_message_path
  end

  def send_message

  end
end