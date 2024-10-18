class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def welcome
    render "sessions/welcome"
  end

  def homepage
    if session[:user_id]
      redirect_to user_path(session[:user_id])
    else
      redirect_to login_path
    end
  end


  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_mfa_session_path(@user.id)
    else
      message = "Something went wrong, Try again"
      redirect_to login_path, alert: message
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
