require "mock5"

@beernivore_api = Mock5.mock("https://beernivore.com") do
  get "/health_check" do
    headers["Content-Type"] = "application/json"

    return { app: { healthy: "true",
                    message: "success",
                    uptime: 50_000 },
             # for now, the database does not matter for us :)
             db: { healthy: "true",
                   message: "connected" },
             elasticsearch: { healthy: "true",
                              message: "ok" } }.to_json
  end
end
