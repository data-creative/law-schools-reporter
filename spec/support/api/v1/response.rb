module Api::V1::Response
  def parsed_response
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include Api::V1::Response
end
