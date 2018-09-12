require 'rails_helper'

RSpec.describe "Index endpoint" do
  it "returns authorization error if no token is provided" do
    user = FactoryBot.create(:user)
    hotels = Array.new(5){FactoryBot.create(:hotel, manager: user)}

    get "/api/v1/hotels"

    expect(response).to have_http_status(:unauthorized)
  end

  context "if the user's token is provided" do
    it "returns the list of hotels managed by the user" do
      user = FactoryBot.create(:user)
      hotels = Array.new(5){FactoryBot.create(:hotel, manager: user)}

      get "/api/v1/hotels", nil, {
                                    'X-User-Email' => user.email,
                                    'X-User-Token' => user.authentication_token
                                  }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json")

      parsed = JSON.parse(response.body)
      expect(parsed.is_a? Array).to eq(true)

      expect(parsed.size).to eq(hotels.size)

      parsed.each do |h|
        expect(h["manager"]["id"]).to eq(user.id)
      end
    end
    it "returns only the hotels managed by the user" do
      users = Array.new(5){ FactoryBot.create(:user) }
      hotels = Array.new(20){ FactoryBot.create(:hotel, manager: users.sample) }

      users.each do |u|
        get "/api/v1/hotels", nil, {
                                      'X-User-Email' => u.email,
                                      'X-User-Token' => u.authentication_token
                                    }

        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq("application/json")

        parsed = JSON.parse(response.body)
        expect(parsed.is_a? Array).to eq(true)

        expect(parsed.size).to eq(u.hotels.size)

        parsed.each do |h|
          expect(h["manager"]["id"]).to eq(u.id)
        end
      end
    end
  end
end
