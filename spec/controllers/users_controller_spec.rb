    require 'rails_helper'

    RSpec.describe UsersController, type: :controller do
    # Retrieve users from the seed data for the test cases
    let(:kamilya) { User.create(username: 'Kamilya', email: 'kamilya@example.com', password: 'password') }
    let(:khari)   { User.create(username: 'Khari', email: 'khari@example.com', password: 'password') }
    let(:chiara)  { User.create(username: 'Chiara', email: 'chiara@example.com', password: 'password') }
    let(:mauro)   { User.create(username: 'Mauro', email: 'mauro@example.com', password: 'password') }

    let(:valid_attributes) do
        {
        username: 'newuser',
        email: 'newuser@example.com',
        password: 'password',
        password_confirmation: 'password'
        }
    end

    let(:invalid_attributes) do
        {
        username: '',
        email: 'invaliduser@example.com',
        password: 'password',
        password_confirmation: 'mismatch'
        }
    end

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

    describe 'GET #new' do
        it 'assigns a new User to @user' do
        get :new
        expect(assigns(:user)).to be_a_new(User)
        end

        it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
        end
    end

    describe 'POST #create' do
        context 'with valid attributes' do
        it 'creates a new user' do
            expect {
            post :create, params: { user: valid_attributes }
            }.to change(User, :count).by(1)
        end

        it 'sets the session user_id to the new user’s id' do
            post :create, params: { user: valid_attributes }
            expect(session[:user_id]).to eq(User.last.id)
        end

        it 'sets the session username to the new user’s username' do
            post :create, params: { user: valid_attributes }
            expect(session[:username]).to eq(User.last.username)
        end

        it 'redirects to the login page' do
            post :create, params: { user: valid_attributes }
            expect(response).to redirect_to(login_path)
        end

        it 'sets a success flash message' do
            post :create, params: { user: valid_attributes }
            expect(flash[:notice]).to eq('User successfully registered! you can now log in')
        end
        end

        context 'with invalid attributes' do
        it 'does not create a new user' do
            expect {
            post :create, params: { user: invalid_attributes }
            }.not_to change(User, :count)
        end

        it 're-renders the new template' do
            post :create, params: { user: invalid_attributes }
            expect(response).to render_template(:new)
        end
        end
    end
    end
