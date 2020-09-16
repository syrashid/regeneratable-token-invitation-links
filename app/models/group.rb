class Group < ApplicationRecord
  has_secure_token :invite_token
  has_many :memberships
  has_many :users, through: :memberships
end
