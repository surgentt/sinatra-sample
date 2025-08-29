require 'spec_helper'

RSpec.describe "Users Endpoint" do
  context 'get /users' do
    let(:users) { [create(:user)] }

    before { users }

    it "returns 200" do
      get '/users'
      expect(last_response.status).to eq(200)

      data = JSON.parse(last_response.body)
      expect(data).to be_an(Array)
      expect(data.pluck('id', 'name', 'email')).to eq(users.pluck(:id, :name, :email))
    end
  end

  context 'post /users' do
    let(:params) { { name: "Ava", email: "ava@example.com" } }

    it "returns 201" do
      post "/users", params
      expect(last_response.status).to eq(201)
      data = JSON.parse(last_response.body)
      expect(data.slice('name', 'email')).to eq({"name"=>"Ava", "email"=>"ava@example.com"})
    end
  end

  context 'patch /users/:id' do
    let(:user) { create(:user, name: 'Old', email: 'old@example.com') }
    let(:params) { { name: "Ava", email: "ava@example.com" } }

    before { user }

    it "returns 201" do
      patch "/users/#{user.id}", params
      expect(last_response.status).to eq(200)
      data = JSON.parse(last_response.body)
      expect(data.slice('name', 'email')).to eq({"name"=>"Ava", "email"=>"ava@example.com"})
    end
  end
end
