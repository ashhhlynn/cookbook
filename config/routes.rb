Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

root 'application#index'

 get  '/signup',  to: 'users#new' 
 post '/signup',  to: 'users#create' 


 get '/auth/github/callback' => 'sessions#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users 
  resources :recipes 


  resources :recipes, only: [:index] do
    resources :reviews, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  end


end
