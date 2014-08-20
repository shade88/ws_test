class PublicController < ApplicationController
  #before_filter :create_messages
  #def self.PublicController
  #  @messages=[]
  #end
  #attr_accessor :messages
  #

  def index
    #cookies[:messages]=nil
    @messages= session[:messages]
  end

  def new_message
    #session[:messages]||=Array.new
    #session[:messages]<<params[:message]
    #@messages= params[:messages]
    WebsocketRails.dispatcher.trigger 'chat.new_message', {msg_body:params[:message]}
    redirect_to root_path
  end

  private
  def create_messages
    @messages=[]
  end
end
