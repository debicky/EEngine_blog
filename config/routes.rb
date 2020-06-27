Rails.application.routes.draw do
  resources :posts do
    resources 'comments', only: [:create, :destroy]
  end
  devise_for :authors
  root 'home#index'
end
