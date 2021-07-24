Rails.application.routes.draw do
  devise_for :accaunts
  get '/accaunts/sign_out', to: "post#index"
  #
  #get 'post/index'
  #get 'post/:id', to: 'posts#show'
  #
  root to: "post#index"
  resources :users, :skills, :certs, :certificates
  resources :info, :recruter
end
