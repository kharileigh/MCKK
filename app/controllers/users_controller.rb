class UsersController < ApplicationController
  def index
    @current_user = User.find_by_id(session[:user_id])

    # get loans associated with user
    @loans = @current_user.loans
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)

    if @user.save
      # get user id
      session[:user_id] = @user.id

      # get username
      session[:username] = @user.username
      # redirect_to user_path(@user.id)
      # redirect_to register_path
      flash[:notice] = "User successfully registered! you can now log in"
      redirect_to login_path

      # redirect_to user_path(session[:user_id])
    else
      render :new
    end
  end

  private
  def user_params
    # permit only -- takes only the parameters
    # require, permit -- takes user object first, then parameters within object -- object not created yet so user is empty
    # params.permit(:username, :password)
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
