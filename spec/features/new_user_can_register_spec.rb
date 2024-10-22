require 'rails_helper'

#---------------- REGISTER
RSpec.describe "User can register", type: :feature do
  # Test Database
  before do
    @user = User.create(username: "Kamilya", password: "test123", email: "Kami@soemthing.com", MFA_secret: nil, google_secret: nil, password_confirmation: "test123")
  end

  scenario "User can register and redirected to login page" do
    visit "/"
    click_link "Register"

    # New User fills in register form
    fill_in 'user[username]', with: "Kamilya"
    fill_in 'user[email]', with: "Kami@soemthing.com"
    fill_in 'user[password]', with: "test123"
    fill_in 'user[password_confirmation]', with: "test123"
    click_button "Register"

    # Create New User
    @user = User.create(username: "Kamilya", email: "Kami@soemthing.com", password: "test123", password_confirmation: "test123")

    # Check New User redirected to correct page
    expect(page).to have_current_path("/login")
  end
end
