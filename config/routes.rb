Rails.application.routes.draw do
  resources :categories
#  get "posts" ,to: "posts#index"
  resources :posts
  resources :users

  
end
