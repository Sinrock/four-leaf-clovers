Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post '/login' => 'sessions#create'
  get '/login' => 'sessions#new'
  
  resources :topics
  resources :posts
  resources :comments
  resources :users
end
