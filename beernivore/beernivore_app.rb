require "mock5"

@beernivore_api = Mock5.mock("https://beernivore.com") do
  get "/health_check" do
    headers["Content-Type"] = "application/json"

    return { healthy: "true",
             message: "success",
             # for now, the database does not matter for us :)
             db: { healthy: "true",
                   message: "connected" } }.to_json
  end
end
