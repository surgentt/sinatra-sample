# database.rb

require 'pg'

require 'sinatra'
require 'sinatra/activerecord'

# --- Option 1: Using a Direct Connection URL ---
set :database, {
  adapter: 'postgresql',
  encoding: 'unicode',
  database: 'my_sinatra_app_development',
  pool: 5,
  username: 'tsurgent',
  password: '',
  host: 'localhost'
}
