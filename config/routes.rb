Rails.application.routes.draw do
  resources :categories
  resources :posts
  resources :comments
  resources :users
end
