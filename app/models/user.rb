class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates_confirmation_of :password
  
  # has_encrypted :password, type: :string
  # validates :password, type: :string
  acts_as_google_authenticated lookup_token: :MFA_secret, encrypt_secrets: true
  has_many :loans
  def authenticate(psw)
    if psw == password
      true
    else
      false
    end
  end
end
