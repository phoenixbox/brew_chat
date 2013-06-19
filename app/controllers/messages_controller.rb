class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    Channel.publish(:add_message, params[:message])
    message = Message.find(params[:message][:message_id])
    flash[:notice] = "You added a message"
    # @message = Message.create!(params[:message])
    redirect_to messages_path
  end
end
