RSpec.configure do |rspec_config|
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec

      with.library :rails
    end
  end
end
