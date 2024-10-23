require 'rails_helper'

RSpec.describe User, type: :model do
  # TEST DATA -- username: "Mauro", password: "test123", email: "Mauro@soemthing.com", MFA_secret: nil, google_secret: nil, password_confirmation: "test123"

  # VALID
  it "is valid with all attributes" do
    user = User.new(username: "Mauro", email: "Mauro@soemthing.com", password: "test123", password_confirmation: "test123")
    expect(user).to be_valid
  end

  # INVALID - no username
  it "is not valid with missing username" do
    user = User.new(email: "Mauro@soemthing.com", password: "test123", password_confirmation: "test123")
    expect(user).to_not be_valid
  end

  # INVALID - no email
  it "is not valid with missing email" do
    expect(User.new(username: "Mauro", password: "test123", password_confirmation: "test123")).to_not be_valid
  end

  # INVALID - no password
  it "is not valid with missing password" do
    expect(User.new(username: "Mauro", email: "Mauro@soemthing.com", password_confirmation: "test123")).to_not be_valid
  end

  # INVALID - password confirmation does not match
  it "is not valid without password confirmation" do
    user = User.new(username: "Mauro", email: "Mauro@soemthing.com", password: "test123", password_confirmation: "no_match")
    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end
end
