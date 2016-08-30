Rails.application.routes.draw do
  resources :reports
  devise_for :users, controllers: {registrations: 'users/registrations' }
  resources :properties
  resources :users, path: :manage_users, controller: :manage_users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'home#index'
end
