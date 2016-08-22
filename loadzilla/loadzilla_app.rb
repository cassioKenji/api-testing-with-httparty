require 'sinatra'

get "/health_check" do
  return "I'm fine!"
end