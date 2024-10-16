class User < ApplicationRecord
  has_encrypted :password, type: :string
end
