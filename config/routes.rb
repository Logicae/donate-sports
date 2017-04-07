Rails.application.routes.draw do

  resources :products
  resources :users
  resources :sports

  get 'auth/github', :as => 'github_auth'
  match 'auth/github/callback', to: 'sessions#create', :via => [:get, :post]

  resources :sports, only: [:show] do
    resources :products, only: [:new, :index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
