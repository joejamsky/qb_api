class Game < ApplicationRecord
  belongs_to :drone, class_name: 'User', optional: true 
  belongs_to :queen, class_name: 'User', optional: true
  belongs_to :user, optional: true

  # has_many :game_questions
  # has_many :answers, through: :game_questions
end
