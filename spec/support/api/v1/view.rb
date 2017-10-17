module Api::V1::View
  def parsed_view
    JSON.parse(rendered)
  end
end

RSpec.configure do |config|
  config.include Api::V1::View
end
