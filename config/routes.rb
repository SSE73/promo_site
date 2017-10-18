Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  resources :posts
  resources :tags, only: [:show]
  resources :categories

  get 'about_me/index'
  get 'home/index'
  get 'posts/index'

  root "posts#index"

end
