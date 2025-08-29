require "sinatra/base"
require "sinatra/activerecord"
require "./config/database"

# Load controllers
require_relative "./controllers/users_controller"

class App < Sinatra::Base
  use UsersController
end
