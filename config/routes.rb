Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # get '/login', to: 'users#login_form'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :dashboard, only: [:index]
  resources :discover, only: [:index]
  resources :friendships, only: [:new, :create]
  resources :movies, only: [:index, :show]
  resources :parties, only: [:new, :create]
end
