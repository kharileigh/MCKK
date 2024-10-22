require 'rails_helper'

RSpec.describe "User fails login" do
  # Test Database
  before do
    @user = User.create(email: "Khari@soemthing.com", password: "test123")
  end

  scenario "User fails to login, pop-up displayed and login page refreshed" do
    visit "/login"

    # Fill in Login Form incorrect password
    fill_in :email, with: "Khari@soemthing.com"
    fill_in :password, with: "test111"
    click_button "Log In"

    expect(page).to have_content("Something went wrong, Try again")
    expect(page).to have_current_path("/login")
  end
end
