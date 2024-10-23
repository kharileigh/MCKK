require 'rails_helper'

RSpec.describe UserMfaSessionsController, type: :controller do

    describe 'GET #index' do
        context 'when the user is logged in' do
            before do
                session[:user_id] = kamilya.id
                get :index
            end

            it 'assigns @current_user to the logged-in user' do
                expect(assigns(:current_user)).to eq(kamilya)
            end

            it 'assigns @loans to the current user’s loans' do
                expect(assigns(:loans)).to eq(kamilya.loans)
            end

            it 'renders the index template' do
                expect(response).to render_template(:index)
            end
        end

        context 'when no user is logged in' do
            before do
                get :index
            end

            it 'does not assign @current_user' do
                expect(assigns(:current_user)).to be_nil
            end

            it 'redirects to the login page' do
                expect(response).to redirect_to(login_path)
            end
        end
    end

end