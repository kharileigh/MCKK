require 'rails_helper'

RSpec.describe "Sessions", type: :request do
<<<<<<< HEAD

  describe "GET /new" do
    it "returns http success" do
      get "/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/sessions/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/sessions/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
=======
  describe "GET /index" do
    it "returns http success" do
      get "/sessions/index"
      expect(response).to have_http_status(:success)
    end
>>>>>>> 44ba343 (iniitial commit)
  end

end
