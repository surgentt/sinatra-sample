require 'spec_helper'

RSpec.describe "Users endpoint" do
  it "returns 200 for /users" do
    get '/users'
    expect(last_response.status).to eq(200)

    data = JSON.parse(last_response.body)
    expect(data).to be_an(Array)
  end
end
