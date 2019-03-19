Rails.application.routes.draw do


  resources :tshirts

  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
