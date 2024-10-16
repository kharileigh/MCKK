class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :check_mfa

  private
  def check_mfa
    # skip the mfa check if on login_path
    if request.path == login_path
      return
    end

    if !(user_mfa_session = UserMfaSession.find) && (user_mfa_session ? user_mfa_session.record == current_user : !user_mfa_session)
      redirect_to new_user_mfa_session_path
    end
    if "/logout" == request.path
      current_user.mfa_secret = nil
      current_user.save!
      UserMfaSession.destroy
    end
  end
end
