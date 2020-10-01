class Group < ApplicationRecord
  has_secure_token :invite_token
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  def member?(user)
    users.include?(user)
  end

  def to_param
    invite_token
  end
end
