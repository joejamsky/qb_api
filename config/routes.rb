Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # User and auth stuff
  resources :users, only: [:index]
  resources :questions, only: [:index]
  resources :matches, only: [:index]
  post '/login', to: 'auth#login'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#profile'
end
