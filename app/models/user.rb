class User < ApplicationRecord
  # has_encrypted :password, type: :string
  acts_as_google_authenticated lookup_token: :mfa_secret, encrypt_secrets: true
end
