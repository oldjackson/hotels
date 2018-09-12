FactoryBot.define do
  factory :hotel do
    name          { Faker::Address.street_name }
    country_code  { IsoCountryCodes.for_select.sample[1] }
    description   { Faker::Lorem.sentence(3, true, 3) }
    average_price_cents { 100 * (20..250).to_a.sample }
    manager       { FactoryBot.create(:user) }
  end
end
