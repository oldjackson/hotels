require 'rails_helper'

RSpec.describe "Index endpoint" do
  it "returns authorization error if a token is not provided" do
    user = FactoryBot.create(:user)
    user.save
    hotels = Array.new(5){FactoryBot.create(:hotel, manager: user)}

    get "/api/v1/hotels"

    expect(response).to have_http_status(:unauthorized)
  end
end
