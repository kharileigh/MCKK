require 'rails_helper'

RSpec.describe UserMfaSessionsController, type: :controller do
    let(:user) { User.create(username: 'Kamilya', email: 'kamilya@example.com', password: 'password') }

    context "when user is logged in" do
        before do
            session[:user_id] = user.id
        end
        it 'create a valid qr code' do
            get :new
            expect(assigns(:current_user)).to eq(user)
            expect(assigns(:link)).to be_present
        end
    end

    context "when user is logged in" do
        before do
            session[:user_id] = user.id
            allow(user).to receive(:google_authentic?).and_return(true)
        end
        # it 'goes to the dashboard'
    end
end