Rails.application.routes.draw do

  root to: 'pages#home'

  resources :tshirts
  resources :items
  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  devise_for :users, controllers: {
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth_callbacks'
      }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tshirts
      resources :items
      resources :orders, only: [:show, :create] do
        resources :payments, only: [:new, :create]
      end
    end
  end


  resources :users, only: [:show]
  match 'users' => 'users#index', :via => :get, :as => :admin_users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  match 'edit_user/:id' => 'users#edit', :via => :get, :as => :admin_edit_user
  match 'update_user/:id' => 'users#update', :via => :patch, :as => :admin_update_user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
