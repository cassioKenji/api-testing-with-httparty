require 'mock5'

@beernivore_api = Mock5.mock("https://beernivore-api.com") do
  get "/health_check" do
    MultiJson.dump(
      healthy: "true",
      message: "success",
    )
  end
end