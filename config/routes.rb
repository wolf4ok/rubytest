Rails.application.routes.draw do
  get 'post/index'
  get 'post/:id', to: 'posts#show'

  root to: "post#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
