Rails.application.routes.draw do
  devise_for :authors
  root 'home#index'
end
