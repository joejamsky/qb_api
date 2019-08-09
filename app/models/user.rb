class User < ApplicationRecord
  has_secure_password

  # This lets someone keep track of who
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Match'
  has_many :followees, through: :followed_users
  
  has_many :following_users, foreign_key: :followee_id, class_name: 'Match'
  has_many :followers, through: :following_users

  validates :username, presence: true, uniqueness: true
end


# Class UserSerializer < ActivatModel 
#   attribute :id, :name, :age, :followers, :followees
#   has_many :followers    These are redundant because of attributes?
#   has_many :followees
# end