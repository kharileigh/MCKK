class UserMfaSessionsController < ApplicationController
  skip_before_action :check_mfa, only: [ :new, :create ]
  def new
  end

  def create
    user = User.new(username: "name", password: "test", email: "test@test.com")
    user = current_user # grab your currently logged in user
    p user.google_qr_uri
    user.mfa_secret = params[:mfa_code]
    user.save!
    if user.google_authentic?(params[:mfa_code])
      UserMfaSession.create(user)
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid code"
      render :new
    end
  end
end
