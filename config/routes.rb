Rails.application.routes.draw do
  devise_for :users
  get 'about_me/index'
  get 'home/index'

  root "home#index"

end
