class UserGamesController < ApplicationController

  def index 
    user_games = UserGame.all 
    render json: user_games
  end 

  def create 
    user_game = UserGame.create(user_id: params['user']['id'], game_id: params['game']['id'])
    render json: user_game
  end

  def poll
    user_games = UserGame.all
    if user_games 
      render json: user_games
    else 
      render json: { error: "Games not found"}
    end
  end

end
