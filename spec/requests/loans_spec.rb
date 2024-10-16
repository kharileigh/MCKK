require 'rails_helper'

RSpec.describe "Loans", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/loans/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/loans/create"
      expect(response).to have_http_status(:success)
    end
  end

end
