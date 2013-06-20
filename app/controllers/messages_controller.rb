class MessagesController < ApplicationController
  def index
    @messages = Message.all
    render :json => @messages
  end

  def create
    data = JSON.parse(params[:message])
    Channel.publish(:add_message_to_game, data)
    @message = Message.create!(data)
    render :json => @message
  end
end

