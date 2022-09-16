Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'application#index'

  resources :users 
  resources :recipes 
  resources :reviews 
  resources :ingredients 
  resources :recipe_ingredients 


end
