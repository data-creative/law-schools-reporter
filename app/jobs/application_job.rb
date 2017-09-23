class ApplicationJob < ActiveJob::Base
  def announce(message)
    if Rails.env.development?
      puts "-------------------------------"
      puts message
      puts "-------------------------------"
    end
  end

  def log(message)
    if Rails.env.development?
      puts message
    end
  end
end
