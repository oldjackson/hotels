require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    FactoryBot.create(:user)
  end
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a valid email" do
    subject.email = "aaa"
    expect(subject).to_not be_valid
  end
  it "is not valid without a first name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end
end
