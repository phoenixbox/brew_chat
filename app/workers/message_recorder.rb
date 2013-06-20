class MessageRecorder
  def self.record(message)
    Message.create(message)
  end

  def self.run
    puts "Looking for new messages"
    Channel.subscribe(:add_message_to_game)
  end
end

