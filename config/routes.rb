Rails.application.routes.draw do
  get 'about_me/index'
  get 'home/index'

  root "home#index"

end
