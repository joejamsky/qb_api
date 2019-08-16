class GameQuestionsController < ApplicationController

  def create 
    byebug
    # max_questions = 3
    # allQuestions = []
    # randomQuestions = allQuestions.slice(0)
    # i = allQuestions.length
    # while i-- do 

    # end 
    game_question = GameQuestion.create(question_id: 1, game_id: 1)
  end 
end


# let max_questions = 3
# let allQuestions = this.state.questions
# var randomQuestions = allQuestions.slice(0), i = allQuestions.length, temp, index;
# while (i--) {
#     index = Math.floor((i + 1) * Math.random());
#     temp = randomQuestions[index];
#     randomQuestions[index] = randomQuestions[i];
#     randomQuestions[i] = temp;
# }
# return randomQuestions.slice(0, max_questions);