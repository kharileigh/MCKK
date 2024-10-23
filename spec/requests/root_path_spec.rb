require 'rails_helper'

RSpec.describe "Root Path", type: :routing do
  # GET /, to: "sessions#welcome"
  it "displays welcome page" do
    expect(get: "/").to route_to(controller: "sessions", action: "welcome")
  end

  # POST / - invalid
  it "fails to send request" do
    expect(post: "/").to_not be_routable
  end
end