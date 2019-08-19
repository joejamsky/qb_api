Question.create(text: 'A great opening line to start a conversation with a stranger at a party')
Question.create(text: 'Something you refuse to say sorry for')
Question.create(text: 'Why the T-Rex had teeny tiny arms')
Question.create(text: 'The worst song when stripping for a lover')
Question.create(text: 'The worst thing to say at a graduation speech')
Question.create(text: 'What gets better with age')
Question.create(text: 'Maybe she\'s born with it. Maybe it\'s...?')
Question.create(text: 'The source of all of my power')
Question.create(text: 'What do old people smell like?')
Question.create(text: 'What are your parents hiding from you?')
Question.create(text: 'Why I drink')
Question.create(text: 'The secret to a happy life')
Question.create(text: 'The biggest downside to living in Hell')
Question.create(text: 'Jesus\'s REAL last words')
Question.create(text: 'The worst thing for an evil witch to turn you into')
Question.create(text: 'The jellybean flavor that just missed the cut')
Question.create(text: 'On your wedding night, it would be horrible to find out that the person you married is...?')
Question.create(text: 'A name for a really bad Broadway musical')
q3 = Question.create(text: 'The first thing you would do after winning the lottery')
q2 = Question.create(text: 'Name a TV drama that\'s about a vampire doctor')
q1 = Question.create(text: 'The crime you would commit if you could get away with it')


# t.string "username"
# t.string "password_digest"
# t.string "email"
# t.string "profile_pic"
# t.string "bio"
# t.integer "age"
# t.boolean "queen"
user1 = User.create(username: 'Joe', password: '123', email: "joe@joe.com", profile_pic: "https://www.biography.com/.image/t_share/MTIwNjA4NjMzODg2NTc0MDky/abraham-lincoln-9382540-2-402.jpg", bio: "King of the world", age: 20)
user2 = User.create(username: 'Moe', password: '123', email: "Moe@moe.com", profile_pic: "https://www.onthisday.com/images/people/george-washington-medium.jpg", bio: "Lord of the Westeros", age: 21)
user3 = User.create(username: 'Gloe', password: '123', email: "Gloe@gloe.com", profile_pic: "https://www.biography.com/.image/t_share/MTE5NDg0MDU1MDEwMjQ4MjA3/thomas-jefferson-9353715-1-402.jpg", bio: "Queen of the Essos", age: 22)
user4 = User.create(username: 'Bro', password: '123', email: "Bro@bro.com", profile_pic: "https://upload.wikimedia.org/wikipedia/commons/7/70/John_Adams%2C_Gilbert_Stuart%2C_c1800_1815.jpg", bio: "Jester boy", age: 23)

# Match.create(follower_id: user1.id, followee_id: user2.id)
# Match.create(follower_id: user1.id, followee_id: user3.id)
# Match.create(follower_id: user2.id, followee_id: user1.id)
# t.integer "follower_id"
# t.integer "followee_id"

# game1 = Game.create(user_id: user1.id, drone_id: user2.id)
# lobby1 = UserGame.create(user_id: user1.id, game_id: game1.id)
# lobby1 = UserGame.create(user_id: user2.id, game_id: game1.id)
# gq1 = GameQuestion.create(question_id: q1.id, game_id: game1.id)
# gq2 = GameQuestion.create(question_id: q2.id, game_id: game1.id)
# gq3 = GameQuestion.create(question_id: q3.id, game_id: game1.id)

# user just needs GameQuestions and answers. 
# They do not need to be associated with a game. But they need to be associated with a user. 
# Maybe?

# Answer.create(content: "maybe", game_question_id: gq1.id , user_id: user2.id)
# Answer.create(content: "no", game_question_id: gq2.id , user_id: user2.id,)
# Answer.create(content: "yes", game_question_id: gq3.id , user_id: user2.id)

# Choice.create(user_id: user1.id, drone_id: user2.id, game_id: game1.id)