Rails.application.routes.draw do
  resources :topics
  resources :posts
  resources :comments
  resources :users
end
