Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :posts
  root "posts#index"
  get '/index' => 'posts#index'
  
end