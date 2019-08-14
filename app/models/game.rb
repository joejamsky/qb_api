class Game < ApplicationRecord
  # belongs_to :drone, class_name: 'User', optional: true 
  # belongs_to :queen, class_name: 'User', optional: true
  # belongs_to :user, optional: true

  has_many :user_games
  has_many :users, through: :user_games
  has_many :game_questions
  has_many :questions, through: :game_questions
  has_many :answers, through: :game_questions
  has_one :choice
end
