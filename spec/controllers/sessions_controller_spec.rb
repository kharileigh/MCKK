require 'rails_helper'

RSpec.describe SessionsController do

  let(:user) { User.create(id:1, username: 'Kamilya', email: 'kamilya@example.com')}


  describe "GET welcome" do
    it "renders the welcome template" do
      get :welcome
      expect(response).to render_template("sessions/welcome")
    end
  end

  describe "GET welcome" do
    it "render welcome page" do
      get :welcome
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
  context 'with valid credentials' do
    before do
      user.password = 'password123'
      user.save!
      post :create, params: { email: user.email, password: 'password123' }
    end

    it 'sets the session user_id' do
      expect(session[:user_id]).to eq(user.id)
    end

    it 'redirects to the MFA session path' do
      expect(response).to redirect_to(user_mfa_session_path(user.id))
    end
  end

    context 'with invalid credentials' do
      before { post :create, params: { email: user.email, password: 'wrong_password' } }

      it 'does not set the session user_id' do
        expect(session[:user_id]).to be_nil
      end

      it 'redirects to the login path with an alert message' do
        expect(response).to redirect_to(login_path)
        expect(flash[:alert]).to eq("Something went wrong, Try again")
      end
    end
  end

  describe 'DELETE #destroy' do
    before { session[:user_id] = user.id }

    it 'clears the session user_id' do
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it 'redirects to the root path' do
      delete :destroy
      expect(response).to redirect_to(root_path)
    end
  end

end
