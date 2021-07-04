Rails.application.routes.draw do

  devise_for :users
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'
  
  resources :topics
  resources :posts
  resources :comments
  resources :users
end
