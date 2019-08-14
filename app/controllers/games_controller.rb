class GamesController < ApplicationController

  def index 
    games = Game.all 
    render json: games
  end 

  def create 
    game = Game.create(queen_id: params['id'])
    # game needs three questions 
    # GameQuestions
    # { game: game, questions: game.questions   }
    render json: game
  end 

  def joinDrone
    game = Game.find_by(drone_id: nil)
    if game 
      game.update(drone_id: params['id'])
      render json: game
    end   
    msg = { :message => "Drone can't join game"}
    render json: msg
  end

  def pollQueen 
    game = Game.find_by(queen_id: params['id'])
    if game 
      if game.drone_id === nil 
        msg = { :message => "Game not full yet"}
        render json: msg
      else
        # THIS IS SUCCESS ROUTE 
        # byebug
        render json: { game: game, drone: game.drone }
      end 
    else 
      msg = { :message => "Can't find queen game"}
      render json: msg
    end 
  end 

  def pollDrone
    game = Game.find_by(drone_id: params['id'])
    if game 
      render json: game 
    else 
      msg = { :message => "Can't find drone game"}
      render json: msg
    end 
  end

end
