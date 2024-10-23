require 'rails_helper'

RSpec.describe "Loan Routes", type: :routing do
  # GET /application, to: "loans#new"
  it "shows loan application form" do
    expect(get: "/application").to route_to(controller: "loans", action: "new")
  end

  # POST /application, to: "loans#create"
  it "processes application submission" do
    expect(post: "/application").to route_to(controller: "loans", action: "create")
  end
end
