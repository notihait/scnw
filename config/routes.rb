Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :posts
  resources :users
  root "posts#index"
  get '/index' => 'posts#index'
  
end