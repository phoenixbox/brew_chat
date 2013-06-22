class MessagesController < ApplicationController
  def index
    @messages = Message.where(:game_id => params[:game_id])
    render :json => @messages
  end
end

