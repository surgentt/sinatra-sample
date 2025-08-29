ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'rspec'
require 'pry'

# Boot the same Rack app that `rackup` uses
require 'rack'

APP = Rack::Builder.parse_file(File.expand_path('../config.ru', __dir__))

RSpec.configure do |config|
  config.include Rack::Test::Methods

  def app
    APP
  end
end
