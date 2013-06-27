require 'eventmachine'
require 'faye'
class MessageRecorder
  def self.record(message)
    message = Message.create(message)
  end

  def self.run
    puts "Looking for new messages"
    Channel.subscribe(:add_message_to_game)
  end
end

