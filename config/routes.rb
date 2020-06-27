Rails.application.routes.draw do
  resources :posts
  devise_for :authors
  root 'home#index'
end
