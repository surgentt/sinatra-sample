require "sinatra"
require "sinatra/base"
require "json"
require "pry"
require_relative "../models/user"

class UsersController < Sinatra::Base
  before do
    content_type :json
  end

  # GET all users
  get "/users" do
    User.all.to_json
  end

  # POST create user
  post "/users" do
    user = User.new(name: params["name"], email: params["email"])

    if user.save
      status 201
      user.to_json
    else
      status 422
      { error: user.errors.full_messages }.to_json
    end
  end

  # PUT update user
  put "/users/:id" do
    user = User.find_by(id: params[:id])
    halt 404, { error: "User not found" }.to_json unless user

    data = JSON.parse(request.body.read)
    if user.update(name: data["name"], email: data["email"])
      user.to_json
    else
      status 422
      { error: user.errors.full_messages }.to_json
    end
  end
end
