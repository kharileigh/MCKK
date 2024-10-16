class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    redirect_to user_path
  end
end
