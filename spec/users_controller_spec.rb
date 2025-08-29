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
end
