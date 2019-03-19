Rails.application.routes.draw do

  resources :tshirts, only: [:index, :new, :create, :show, :update, :edit]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
