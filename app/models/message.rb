class Message < ActiveRecord::Base
  validates_presence_of :content
  validates_presence_of :team_name
  validates_presence_of :game_id

end


class CommentService
  def self.messages_for_game_id(id)
    data = JSON.parse(Faraday.get("http://localhost:3001/messages?game_id#{id}").body)
  end
end

class ProxyMessage

  attr_reader :content, :team_name, :game_id

  def initialize(input)
    input = HashWithInDifferentAccess.new(input)
    @content = input[:content]
    @team_name = input[:team_name]
    @game_id = input[:game_id]
    @message_id = input[:comment_id]
    @created_at = input[:created_at]
  end

  def self.parse_collection(messages)
    messages.collect{|message| ProxyMessage.new(message)}
  end


end