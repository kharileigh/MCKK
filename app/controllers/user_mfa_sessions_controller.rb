class UserMfaSessionsController < ApplicationController
  skip_before_action :check_mfa, only: [ :new, :create ]
  def new
    @link = generate_qr
  end

  def create
    @current_user = User.find_by_id(session[:user_id]) # Get user by id
    @current_user.MFA_secret = params[:mfa_code] # Get MFA code from user in form
    @current_user.save! # Save user

    if @current_user.google_authentic?(params[:mfa_code]) # Check if 6 digit code matches QR code
      UserMfaSession.create(@current_user) # If matches, create a MFA session 
      redirect_to user_path # User dashboard
    else
      flash.now[:danger] = "Invalid code"
      render :new
    end
  end


  private
  def generate_qr
    @current_user = User.find_by_id(session[:user_id])

    if @current_user.nil?
      redirect_to login_path, alert: "Log in first"
    elsif @current_user.MFA_secret.nil? # Checks if no MFA secret set for user
      @current_user.set_google_secret # Set Google secret that is then encrypted into QR code
      @link = @current_user.google_qr_uri # Generate QR code URL which holds Google secret
      @current_user.save! # Save user after setting MFA secret
      return @link # Ensures this returns the QR code URL
    else
      redirect_to user_mfa_session_path, alert: "you need to sign in first"
    end
  end
end





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