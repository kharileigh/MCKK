class User < ApplicationRecord
  has_encrypted :password
end
