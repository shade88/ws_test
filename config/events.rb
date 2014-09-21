WebsocketRails::EventMap.describe do
  namespace :chat do
    subscribe :new_message, to: ChatController, with_method: :new_message
    subscribe :send_message, to: ChatController, with_method: :send_message
  end
  subscribe :authorize_user, to: ChatController, with_method: :authorize_user

  namespace :websocket_rails do
    subscribe :subscribe_private, :to => AuthorizationController, :with_method => :authorize_channels
  end
end
