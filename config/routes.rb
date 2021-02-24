Rails.application.routes.draw do
  resources :authored_comments
  resources :topics
  resources :posts
  resources :comments
  resources :users
end
