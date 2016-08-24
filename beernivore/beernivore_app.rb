require 'mock5'

@beernivore_api = Mock5.mock("https://beernivore.com") do

  get "/health_check" do
    headers['Content-Type'] = "application/json"

    return {:healthy => "true", :message => "success"}.to_json
  end

end