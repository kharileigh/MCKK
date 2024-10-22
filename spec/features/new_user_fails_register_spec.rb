require 'rails_helper'

#---------------- REGISTER
RSpec.describe "User fails to register", type: :feature do
  # Test Database
  before do
    @user = User.create(password: "test123", email: "Kami@soemthing.com", MFA_secret: nil, google_secret: nil, password_confirmation: "test123")
  end

  scenario "User fails to be registered because empty field" do
    visit "/register"

    # Simulate failed registration with an empty field
    fill_in "user[email]", with: "Kami@soemthing.com"
    fill_in "user[password]", with: "test123"
    fill_in "user[password_confirmation]", with: "test_wrong_password"
    click_button "Register"

    # Expecations - user shown pop up, page is refreshed
    expect(page).to have_content("Password confirmation doesn't match")
    expect(page).to have_content("Username can't be blank")
    expect(page).to have_current_path("/register")
  end
end
