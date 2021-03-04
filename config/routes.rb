Rails.application.routes.draw do
  devise_for :agents
  resources :locks
  resources :properties
  resources :agents
  resources :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "locks#new"

end
