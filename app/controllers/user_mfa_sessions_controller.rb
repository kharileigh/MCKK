class UserMfaSessionsController < ApplicationController
  skip_before_action :check_mfa, only: [ :new, :create ]
  before_action :set_current_user, only: [ :create, :new ]

  def new
    p @current_user
    @link = generate_qr
  end

  def create
    @current_user.MFA_secret = params[:mfa_code] # Get MFA code from user in form
    @current_user.save! # Save user

    if @current_user.google_authentic?(params[:mfa_code]) # Check if 6 digit code matches QR code
      UserMfaSession.create(@current_user) # If matches, create a MFA session
      redirect_to "/users/#{@current_user.id}" # User dashboard
      # redirect_to "/"
    else
      flash.now[:danger] = "Invalid code"
      redirect_to user_mfa_session_path
    end
  end


  private

  def set_current_user
    @current_user = User.find_by_id(session[:user_id])
    if @current_user.nil?
      redirect_to login_path, alert: "Log in first"
    end
  end

  # def google_secret
  #   if @current_user.google_secret.nil?
  #     set_google_secret
  #   end
  # end

  def generate_qr
    if @current_user.google_secret.nil?
      @current_user.set_google_secret
      @current_user.save!
    end
    @link = @current_user.google_qr_uri # Generate QR code URL which holds Google secret
    @current_user.save! # Save user after setting MFA secret
    @link # Ensures this returns the QR code URL
  end
end
