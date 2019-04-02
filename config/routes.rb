Rails.application.routes.draw do

  root to: 'pages#home'

  resources :tshirts do
    member do
      get :new_tshirt
      post :new_tshirt, to: 'tshirts#initialize_cart', as: :initialize_cart
    end
  end
  get :shopping_cart, to: 'orders#shopping_cart', as: :shopping_cart
  resources :items, only: [:index, :create, :destroy]
  resources :orders, only: [:show, :create, :shopping_cart] do
    resources :payments, only: [:new, :create]
  end

  devise_for :users, controllers: {
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth'
  }

  resources :users, only: [:show]
  match 'users' => 'users#index', :via => :get, :as => :admin_users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  match 'edit_user/:id' => 'users#edit', :via => :get, :as => :admin_edit_user
  match 'update_user/:id' => 'users#update', :via => :patch, :as => :admin_update_user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
