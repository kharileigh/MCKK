class LoansController < ApplicationController
  def new
    render :application
  end

  # def create
  #   @user = User.new(user_params)

  #   if @user.save

  #     # get user id
  #     session[:user_id] = @user.id

  #     # get username
  #     session[:username] = @user.username

  #     redirect_to user_path(@user.id)
  #   else
  #     render :new
  #   end
  # end

end
