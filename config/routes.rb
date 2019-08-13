Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # User and auth stuff
  # resources :users, only: [:index]
  resources :users
  resources :questions, only: [:index]
  resources :matches, only: [:index]
  resources :games, only: [:index, :create]
  put '/join-drone', to: 'games#joinDrone'
  put '/poll-drone', to: 'games#pollDrone'
  put '/poll-queen', to: 'games#pollQueen'
  post '/login', to: 'auth#login'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#profile'
end
