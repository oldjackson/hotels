require 'rails_helper'

RSpec.describe Hotel, type: :model do
  subject do
    FactoryBot.create(:hotel)
  end
  it "is valid with valid attributes" do
    expect(subject).to be_valid()
  end
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid()
  end
  it "is not valid without a country code" do
    subject.country_code = nil
    expect(subject).to_not be_valid()
  end
  it "is not valid without a valid ISO country code" do
    subject.country_code = "zzz"
    expect(subject).to_not be_valid()
  end
  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid()
  end
  it "is created with zero view count" do
    expect(subject.views_count).to eq(0)
  end
  it "is not valid without a view count" do
    subject.views_count = nil
    expect(subject).to_not be_valid()
  end
  it "is not valid with a negative view count" do
    subject.views_count = -12
    expect(subject).to_not be_valid()
  end
end
