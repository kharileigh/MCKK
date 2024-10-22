class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true
  validates_confirmation_of :password

  # has_encrypted :password, type: :string
  # validates :password, type: :string
  acts_as_google_authenticated lookup_token: :MFA_secret, encrypt_secrets: true
  has_many :loans
end
