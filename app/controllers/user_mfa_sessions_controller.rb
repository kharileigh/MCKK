class UserMfaSessionsController < ApplicationController
  skip_before_action :check_mfa, only: [ :new, :create ]
  def new
    @link = generate_qr
  end

  def create
    # user = @current_user # grab your currently logged in user
    @current_user = User.find_by_id(session[:user_id])
    # user = @current_user
    # secret = @current_user.google_secret
    @current_user.MFA_secret = params[:mfa_code]
    @current_user.save!
    # if user.MFA_secret.nil?
    #   user.generate_mfa_secret! # Assuming this method generates and saves the MFA secret user.save!
    # end
    if @current_user.google_authentic?(params[:mfa_code])
      UserMfaSession.create(@current_user)
      redirect_to root_path # dashboard path
    else
      flash.now[:danger] = "Invalid code"
      render :new
    end
  end

  private
  def generate_qr
    @current_user = User.find_by_id(session[:user_id])

    # if @current_user
    #   if @current_user.MFA_secret.nil?
    #     @current_user.generate_mfa_secret! # Assuming this method generates and saves the MFA secret user.save!
    #     @current_user.save!
    #   end
    #     @current_user.set_google_secret
    #     @current_user.google_qr_uri
    # else
    #   redirect_to welcome_path, alert: "you need to sign in first"

    # end
  end
end
