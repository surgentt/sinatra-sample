ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'rspec'
require 'pry'
require 'factory_bot'

# Boot the same Rack app that `rackup` uses
require 'rack'

APP = Rack::Builder.parse_file(File.expand_path('../config.ru', __dir__))

# Require support files
Dir[File.join(__dir__, 'support', '**', '*.rb')].sort.each { |f| require f }

FactoryBot.definition_file_paths = [File.join(__dir__, 'factories')]
FactoryBot.find_definitions

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include FactoryBot::Syntax::Methods

  def app
    APP
  end
end
