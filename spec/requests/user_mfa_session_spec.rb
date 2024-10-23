require 'rails_helper'

RSpec.describe "User MFA Session Routes", type: :routing do
  # GET /user_mfa_session, to: "user_mfa_sessions#new"
  it "shows 2FA input form" do
    expect(get: "/user_mfa_session").to route_to(controller: "user_mfa_sessions", action: "new")
  end

  # POST /user_mfa_session, to: "user_mfa_sessions#create"
  it "processes 2FA code" do
    expect(post: "/user_mfa_session").to route_to(controller: "user_mfa_sessions", action: "create")
  end
end
