require "rails_helper.rb"

RSpec.describe "Login & Logout Routes", type: :routing do
  # GET /login, to: "sessionsnew"
  it "shows login form" do
    expect(get: "/login").to route_to(controller: "sessions", action: "new")
  end

  # POST /login, to: "sessions#create"
  it "processes login form submission" do
    expect(post: "/login").to route_to(controller: "sessions", action: "create")
  end

  # GET /logout, to: "sessions#destroy"
  it "handles user logout" do
    expect(get: "/logout").to route_to(controller: "sessions", action: "destroy")
  end
end
