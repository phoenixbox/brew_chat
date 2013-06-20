task :message => :environment do
  MessageRecorder.run
end