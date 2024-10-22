require_relative '../rails_helper'
require_relative '../spec_helper'

#------------ LOGIN
RSpec.describe "User can log in", type: :feature do
  # Test Database
  before do
    @user = User.create(email: "Khari@soemthing.com", password: "test123")
  end

  scenario "User can login and redirected to 2FA form" do
    visit "/"
    click_link "Login"

    # Fill in Login Form
    fill_in :email, with: "Khari@soemthing.com"
    fill_in :password, with: "test123"
    click_button "Log In"

    # Check User redirected to correct path
    expect(page).to have_current_path("/user_mfa_session.#{@user.id}")
  end
end
