Rails.application.routes.draw do

  root to: 'pages#home'

  resources :tshirts
  resources :items
  resource :rental, only: [:show]
  # do
    # resources :rentals, only: [:new, :create]
  # end

  # resources :rentals, only: [:destroy]

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }


  resources :users, only: [:show]
  match 'users' => 'users#index', :via => :get, :as => :admin_users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  match 'edit_user/:id' => 'users#edit', :via => :get, :as => :admin_edit_user
  match 'update_user/:id' => 'users#update', :via => :patch, :as => :admin_update_user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
