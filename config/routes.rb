Rails.application.routes.draw do
  #get 'post/index'
  #get 'post/:id', to: 'posts#show'
  root to: "post#index"
  resources :users, :skills, :certs, :certificates
  resources :info, :recruter
end
