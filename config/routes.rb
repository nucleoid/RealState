Rails.application.routes.draw do
  resources :properties
  devise_for :customer_users
  devise_for :agents
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'home#index'
end
