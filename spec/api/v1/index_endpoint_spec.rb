require 'rails_helper'

RSpec.describe "Index endpoint" do
  it "returns authorization error if no token is provided" do
    user = FactoryBot.create(:user)
    5.times { FactoryBot.create(:hotel, manager: user) }

    get "/api/v1/hotels"

    expect(response).to have_http_status(:unauthorized)
  end

  context "if the user's token is provided" do
    it "returns the list of hotels managed by the user" do
      user = FactoryBot.create(:user)
      hotels = Array.new(5) { FactoryBot.create(:hotel, manager: user) }

      get "/api/v1/hotels", nil, {
        'X-User-Email' => user.email,
        'X-User-Token' => user.authentication_token
      }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json")

      parsed = JSON.parse(response.body)
      expect(parsed.is_a?(Array)).to eq(true)

      expect(parsed.size).to eq(hotels.size)

      parsed.each do |h|
        expect(h["manager"]["id"]).to eq(user.id)
      end
    end
    it "returns only the hotels managed by the user" do
      users = Array.new(10) { FactoryBot.create(:user) }
      50.times { FactoryBot.create(:hotel, manager: users.sample) }

      users.each do |u|
        get "/api/v1/hotels", nil, {
          'X-User-Email' => u.email,
          'X-User-Token' => u.authentication_token
        }

        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq("application/json")

        parsed = JSON.parse(response.body)
        expect(parsed.is_a?(Array)).to eq(true)

        expect(parsed.size).to eq(u.hotels.size)

        parsed.each do |h|
          expect(h["manager"]["id"]).to eq(u.id)
        end
      end
    end
    it "returns hotels with descriptions depending on the locale" do
      user = FactoryBot.create(:user)

      I18n.locale = :en
      en_desc = "An exclusive experience right on the Canal Grande"
      hotel = FactoryBot.create(:hotel, name: "L'Orologio", country_code: "it", manager: user, description: en_desc)

      get "/api/v1/hotels", nil, {
        'X-User-Email' => user.email,
        'X-User-Token' => user.authentication_token,
        'Accept-Language' => "en"
      }
      parsed = JSON.parse(response.body)
      expect(parsed[0]["description"]).to eq(en_desc)

      get "/api/v1/hotels", nil, {
        'X-User-Email' => user.email,
        'X-User-Token' => user.authentication_token,
        'Accept-Language' => 'en-UK'
      }
      parsed = JSON.parse(response.body)
      expect(parsed[0]["description"]).to eq(en_desc)

      get "/api/v1/hotels", nil, {
        'X-User-Email' => user.email,
        'X-User-Token' => user.authentication_token,
        'Accept-Language' => "en-US"
      }
      parsed = JSON.parse(response.body)
      expect(parsed[0]["description"]).to eq(en_desc)

      I18n.locale = :"it-IT"
      it_desc = "Un'esclusiva esperienza proprio sul Canal Grande"
      hotel.description = it_desc
      hotel.save

      get "/api/v1/hotels", nil, {
        'X-User-Email' => user.email,
        'X-User-Token' => user.authentication_token,
        'Accept-Language' => "it-IT"
      }
      parsed = JSON.parse(response.body)
      expect(parsed[0]["description"]).to eq(it_desc)

      get "/api/v1/hotels", nil, {
        'X-User-Email' => user.email,
        'X-User-Token' => user.authentication_token,
        'Accept-Language' => "en-US"
      }
      parsed = JSON.parse(response.body)
      expect(parsed[0]["description"]).to eq(en_desc)
    end

    it "returns hotels prices converted from the original currencies to the one preferred by user" do
      user = FactoryBot.create(:user)

      FactoryBot.create(:hotel, country_code: "it", manager: user, average_price: 100)

      get "/api/v1/hotels", nil, {
        'X-User-Email' => user.email,
        'X-User-Token' => user.authentication_token,
        'Accept-Language' => "it"
      }
      parsed = JSON.parse(response.body)
      expect(parsed[0]["average_price"]).to eq(Money.new(10_000, "EUR").format(no_cents_if_whole: true))

      get "/api/v1/hotels", nil, {
        'X-User-Email' => user.email,
        'X-User-Token' => user.authentication_token,
        'Accept-Language' => "en-US"
      }
      parsed = JSON.parse(response.body)
      expect(parsed[0]["average_price"]).to eq(Money.new(10_000, "EUR").exchange_to('USD').format(no_cents_if_whole: true))
    end

    it "returns hotels prices in the original currency if there is no available exchange for the preferred one" do
      user = FactoryBot.create(:user)

      FactoryBot.create(:hotel, country_code: "it", manager: user, average_price: 100)

      get "/api/v1/hotels", nil, {
        'X-User-Email' => user.email,
        'X-User-Token' => user.authentication_token,
        'Accept-Language' => "se"
      }
      parsed = JSON.parse(response.body)
      expect(parsed[0]["average_price"]).to eq(Money.new(10_000, "EUR").format(no_cents_if_whole: true))
    end

    it "triggers the increment of the view count" do
      user = FactoryBot.create(:user)

      FactoryBot.create(:hotel, views_count: 12, manager: user)

      get "/api/v1/hotels", nil, {
        'X-User-Email' => user.email,
        'X-User-Token' => user.authentication_token
      }
      get "/api/v1/hotels", nil, {
        'X-User-Email' => user.email,
        'X-User-Token' => user.authentication_token
      }
      parsed = JSON.parse(response.body)
      expect(parsed[0]["views_count"]).to eq(13)
    end
  end
end
