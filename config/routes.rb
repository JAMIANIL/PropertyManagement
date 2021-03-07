Rails.application.routes.draw do
  use_doorkeeper
  devise_for :agents
  resources :locks
  resources :properties
  resources :agents
  resources :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "locks#new"

  namespace 'api' do
    namespace 'v1' do
      resources :companies,:defaults => { :format => 'json' }
      resources :agents,:defaults => { :format => 'json' }      
    end
  end
end

