class GameQuestion < ApplicationRecord
  has_one :question 
  has_one :game 
  has_many :answers
end
