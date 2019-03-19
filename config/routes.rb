Rails.application.routes.draw do


  resources :tshirts, only: [:index, :new, :create]
  devise_for :users
  resources :users, only: [:index, :show]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
