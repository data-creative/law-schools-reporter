class ApplicationJob < ActiveJob::Base
  def announce(message)
    puts "-------------------------------"
    puts message
    puts "-------------------------------"
  end
end
