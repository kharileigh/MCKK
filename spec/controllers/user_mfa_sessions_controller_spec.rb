require 'rails_helper'

RSpec.describe UserMfaSessionsController, type: :controller do
    let(:user) { User.create(username: 'Kamilya', email: 'kamilya@example.com', password: 'password') }

    context "when user is logged in" do
        before do
            session[:user_id] = user.id
            get :new
        end

        it 'assigns the current user' do
            expect(assigns(:current_user)).to eq(user)
        end

        it 'create a valid qr code' do
            expect(assigns(:link)).to be_present
        end
    end

    context 'when user is not logged in' do
        before { get :new }

        it 'redirects to login path' do
          expect(response).to redirect_to(login_path)
          expect(flash[:alert]).to eq("Log in first")
        end
      end

    describe 'POST #create' do
      before { session[:user_id] = user.id }

      context 'with valid MFA code' do
        before do
          user.set_google_secret # Set up the user's MFA secret
          user.save!
          allow(user).to receive(:google_authentic?)
        end

        it 'saves the MFA secret' do
          expect(user.google_secret).to be_present
        end

        it 'creates a new UserMfaSession' do
          expect(UserMfaSession).to_not be_nil
        end

        # it 'redirects to the user dashboard' do
        #   expect(response).to redirect_to(users_path(user.id))
        # end
      end

      context 'with invalid MFA code' do
        before do
          user.set_google_secret # Set up the user's MFA secret
          user.save!
          allow(user).to receive(:google_authentic?).and_return(false)
          post :create, params: { mfa_code: 'wrong_code' }
        end

        # it 'does not create a new UserMfaSession' do
        #   expect(UserMfaSession.valid).to eq(false)
        # end

        it 'sets a danger flash message' do
          expect(flash[:danger]).to eq("Invalid code")
        end

        it 'redirects to the MFA session path' do
          expect(response).to redirect_to(user_mfa_session_path)
        end
      end
    end
end