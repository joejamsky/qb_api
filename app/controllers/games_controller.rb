class GamesController < ApplicationController

  def index 
    games = Game.all 
    render json: games
  end 

  def create 
    game = Game.create(user_id: params['id'], full: false)
    render json: game
  end 

  def poll 
    game = Game.find(params['game']['id'])
    num_users = game.users.length
    if num_users > 2
      game.update(full: true)
      render json: { bool: "true", num_users: num_users}
    else
      render json: { bool: "false"}
    end
  end

  def init
    max_questions = 3
    game = Game.create(user_id: params['id'], full: false)
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
    game = Game.find_by(full: false)
    user_game = UserGame.create(user_id: params['id'], game_id: game.id)
    if game 
      render json: { game: game, questions: game.questions}
    else 
      msg = { :message => "Drone can't join game"}
      render json: msg
    end 
  end

  def usergame 
    game = Game.find_by(user_id: params['id'])
    if game 
        render json: game 
    else 
      render json: { :message => "get game"}
    end
  end 

  def pollDrone
    game = Game.find(params['id'])
    
    if Answer.where(game_id: game.id).length > 0
      game_answers = Answer.where(game_id: game.id)
      render json: {game: game, questions: game.questions, drones: game.users, answers: game_answers }
    elsif game 
      render json: {game: game, questions: game.questions, drones: game.users}
    else 
      msg = { :message => "Can't find drone game"}
      render json: msg
    end 
  end

  def saveAnswers
    
    savedAnswers = []
    answers = params['answers']
    if answers.length < 4 
      empty = { "answer" => "" }
      index = 3 - answers.length
      for i in 0..index
        answers << empty
      end
    end
    
    questions = params['questions']
    num_ans = params['answers'].length - 1
    userId = params['user']['id']
    game = Game.find(params['game']['id'])
    game_questions = GameQuestion.where(game_id: game.id)
    for i in 0..num_ans
      newAnswer = Answer.create(content: answers[i]['answer'], question_text: questions[i]['text'], game_question_id: game_questions[i].id, user_id: userId, game_id: game.id)
      savedAnswers << newAnswer
    end 
    render json: savedAnswers
  end 

  def createChoice
    userId = params['user']['id']
    droneId = params['id'].to_i
    gameId = params['game']['id']
    choice = Choice.create(user_id: userId, drone_id: droneId, game_id: gameId)
  end 

  def pollChoice
    game = Game.find(params['id'])
    choice = game.choice
    if choice 
      drone_id = choice.drone_id
      queen_id = choice.user_id
      drone = User.find(drone_id)
      queen = User.find(queen_id)
      render json: { queen: queen, drone: drone }
    else
      render json: { error: "No Choice Found"}
    end 
  end 

  # private 

  # def save_params 
  #   params.permit( {:answers => []}, :user, :game)
  # end 

end

# params.permit( {:school => [:id , :name]}, 
#                {:student => [:id, 
#                             :name, 
#                             :address, 
#                             :city]},
#                 {:records => [:marks, :subject]})