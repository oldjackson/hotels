require 'rails_helper'
require 'byebug'

RSpec.describe "User authentication", type: :feature do
  it "creates a well-named user at signup" do
    visit "/users/sign_up"

    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "jd@yourmail.com"
    fill_in "Password", with: "xxxxxx"
    fill_in "Password confirmation", with: "xxxxxx"

    click_button "Sign up"

    expect(User.last.first_name).to eq("John")
    expect(User.last.last_name).to eq("Doe")
  end

  it "allows a known user to log in" do
    last_User = User.create(
      first_name: "Peter",
      last_name: "Pan",
      email: "pp@neverland.com",
      password: "xxxxxx"
    )

    visit "/users/sign_in"

    fill_in "Email", with: "pp@neverland.com"
    fill_in "Password", with: "xxxxxx"

    click_button "Log in"

    expect(page).not_to have_content("Forgot your password?")
  end
end
