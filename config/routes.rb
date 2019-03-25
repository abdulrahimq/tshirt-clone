Rails.application.routes.draw do

  root to: 'pages#home'

  resources :tshirts
  resources :items
  resource :rental, only: [:show]
  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
  # do
    # resources :rentals, only: [:new, :create]
  # end

  # resources :rentals, only: [:destroy]

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  resources :users, only: [:index, :show]
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
