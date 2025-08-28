require 'sinatra'
require 'sinatra/json'
require 'sinatra/cross_origin'
require 'pry'
require 'admin_namespace'

configure do
  enable :cross_origin
end

before do
  content_type :json
end

get '/api/hello' do
  json message: "Hello from Sinatra API!"
end

post '/api/echo' do
  "You sent: #{params}"
end


