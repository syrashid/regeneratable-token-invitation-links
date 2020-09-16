class Group < ApplicationRecord
  has_secure_token :invite_token
end
