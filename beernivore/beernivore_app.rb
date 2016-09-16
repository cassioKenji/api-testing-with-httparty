require 'mock5'
require 'faker'

@beernivore_api = Mock5.mock("https://beernivore.com") do
  get "/health_check" do
    headers["Content-Type"] = request.env["HTTP_ACCEPT"]
    # return JSON.pretty_generate(request.env)

    return { app: { healthy: "true",
                    message: "success",
                    uptime: 50_000 },
             # for now, the database does not matter for us :)
             db: { healthy: "true",
                   message: "connected" },
             elasticSearch: { healthy: "true",
                              message: "ok" } }.to_json
  end

  get "/beer_of_the_day" do
    headers["Content-Type"] = request.env["HTTP_ACCEPT"]
    # return JSON.pretty_generate(request.env)

    return { beer: { name: Faker::Beer.name,
                     veganFriendly: "true",
                     malts: Faker::Beer.malts,
                     hop: Faker::Beer.hop,
                     yeast: Faker::Beer.yeast,
                     alcohol: Faker::Beer.alcohol,
                     location: Faker::Address.country_code },
                     isOrganic: [true,false].sample,
             contactInfo: { site: Faker::Internet.url,
                             email: Faker::Internet.email } }.to_json
  end
end
