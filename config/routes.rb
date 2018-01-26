Rails.application.routes.draw do

  devise_for :users
  root controller: :restaurant, action: :index
  resources :restaurant, only: [:show, :create]
  resources :orders, only: [:show, :create, :update]
  resources :charges, only: [:create, :show]

  namespace :api, defaults: { format: :json } do
<<<<<<< HEAD
    resources :restaurants, only: [:index]
    resources :restaurant_categories, only: [:index]
=======
    resources :restaurants, only: [:index,:show]
>>>>>>> development
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  end
end
