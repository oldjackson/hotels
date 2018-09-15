require 'rails_helper'

RSpec.describe IncrViewCntJob, type: :job do
  it "increments the view count of an array of hotels" do
    user = FactoryBot.create(:user)
    hotels = [FactoryBot.create(:hotel, manager: user),
              FactoryBot.create(:hotel, manager: user, views_count: 12),
              FactoryBot.create(:hotel, manager: user, views_count: 100)]

    IncrViewCntJob.perform_now(hotels.map { |h| h.id })
    expect(hotels.map { |h| Hotel.find(h.id).views_count }).to eq([1, 13, 101])
  end
end
