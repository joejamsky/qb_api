class GamesController < ApplicationController

  def index 
    games = Game.all 
    render json: games
  end 

  def create 
    game = Game.create(user_id: params['id'])
    render json: game
  end 

  def poll 
    game = Game.find(params['game']['id'])
    num_users = game.users.length
    if num_users > 1
      render json: { bool: "true", num_users: num_users}
    else
      render json: { bool: "false"}
    end
  end

  def init
    max_questions = 3
    game = Game.create(user_id: params['id'])
    user_game = UserGame.create(user_id: params['id'], game_id: game.id)
    questions = Question.all
    questions = questions.shuffle
    randomQs = []
    for i in 0..max_questions do
      newQuestion = GameQuestion.create(question_id: questions[i].id, game_id: game.id)
      randomQs << newQuestion
    end

    render json: { game: game, questions: randomQs }
  end 

  def joinDrone
    game = Game.find_by(drone_id: nil)
    user_game = UserGame.create(user_id: params['id'], game_id: game.id)
    if game 
      game.update(drone_id: params['id'])
      render json: { game: game, questions: game.questions}
    else 
      msg = { :message => "Drone can't join game"}
      render json: msg
    end 
  end

  def usergame 
    game = Game.find_by(user_id: params['id'])
    # byebug
    if game 
        render json: game 
    else 
      # byebug
      render json: { :message => "get game"}
    end
  end 

  def pollDrone
    game = Game.find(params['id'])
    if game 
      render json: {game: game, questions: game.questions, drones: game.users, answers: game.answers }
    else 
      msg = { :message => "Can't find drone game"}
      render json: msg
    end 
  end

  def saveAnswers
    byebug 
    
  end 

end
