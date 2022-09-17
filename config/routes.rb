Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'application#index'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'

  resources :users 
  resources :recipes 
  resources :ingredients 
  resources :recipe_ingredients 

  resources :recipes, only: [:index] do
    resources :reviews, only: [:index, :new, :create]
  end


end
