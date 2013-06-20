class Channel
  def self.host
    @host ||= Redis.new
  end

  def self.publish(channel_name, message)
    host.publish(channel_name, message)
  end

  def self.subscribe(channel_name)
    host.subscribe(:add_message_to_game) do |event|
      event.message do |channel, data|
        puts "Writing messages with data: #{data}"
        MessageRecorder.record(JSON.parse(data))
      end
    end
  end
end

#Faye subscribe to redis channel / do http request to publish to brews