class User < ApplicationRecord
  # has_encrypted :password, type: :string
  # validates :password, type: :string
  acts_as_google_authenticated lookup_token: :mfa_secret, encrypt_secrets: true

  def authenticate(psw)
    if psw == password
      true
    else
      false
    end
  end
end
