require "rails_helper.rb"

RSpec.describe "Register Route", type: :routing do
  # GET /register, to: "users#new"
  it "leads to correct controller and action" do
    expect(get: "/register").to route_to(controller: "users", action: "new")
  end

  # POST /register, to: "users#create"
  it "handles registering of a new user" do
    expect(post: "/register").to route_to(controller: "users", action: "create")
  end
end

RSpec.describe "User Dashboard Route", type: :routing do
  # GET /users/:id, to: "users#index"
  it "displays user dashboard" do
    expect(get: "/users/1").to route_to(controller: "users", action: "index", id: "1")
  end
end
