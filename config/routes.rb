Rails.application.routes.draw do

  get 'users/index'
  get 'users/show'
  resources :users
  resources :tshirts, only: [:index, :new, :create]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
