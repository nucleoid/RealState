Rails.application.routes.draw do

  resources :reports do
    member do
      get :export
    end
  end
  devise_for :users, controllers: {registrations: 'users/registrations' }
  resources :properties do
    resources :images
  end
  resources :users, path: :manage_users, controller: :manage_users

  # test routes
  get '/application/index' => 'application#index'
  get '/application/admin' => 'application#admin'

  root :to => 'home#index'
end
