Rails.application.routes.draw do

  root to: 'pages#home'

  resources :tshirts do
    resources :rentals, only: [:new, :create]
  end

  resources :rentals, only: [:destroy]

  devise_for :users

  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
