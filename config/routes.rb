Rails.application.routes.draw do
  resources :posts do
    post 'comments', to: 'comments#create'
  end
  devise_for :authors
  root 'home#index'
end
