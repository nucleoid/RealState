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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'home#index'
end
