class Answer < ApplicationRecord
  belongs_to :user
  # belongs_to :game, optional: true 
  belongs_to :game_question
  
end
