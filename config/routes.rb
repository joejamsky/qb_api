Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # User and auth stuff
  # resources :users, only: [:index]
  resources :users
  resources :questions, only: [:index]
  resources :matches, only: [:index]
  resources :games, only: [:index, :create]
  resources :user_games, only: [:index, :create]
  resources :game_questions, only: [:create]

  post '/initGame', to: 'games#init'
  put '/pollLobby', to: 'games#poll'
  put '/join-drone', to: 'games#joinDrone'
  put '/usergame', to: 'games#usergame'
  get '/poll-drones/:id', to: 'games#pollDrone'
  post '/saveAnswers', to: 'games#saveAnswers'

  # put '/poll-queen', to: 'games#pollQueen'
  
  post '/login', to: 'auth#login'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#profile'
end
