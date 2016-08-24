require 'rspec'
require 'httparty'
require './beernivore/beernivore_app.rb'
require 'pry'
require 'mock5'

Mock5.mount(@beernivore_api)
