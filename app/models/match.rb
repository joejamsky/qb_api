class Match < ApplicationRecord
  # follower is alias for User. Match belongs to first User called a follower.
  belongs_to :follower, class_name: 'User'
  # followee is alias for User. Match belongs to a second User called followee
  belongs_to :followee, class_name: 'User'
end
