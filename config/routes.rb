Rails.application.routes.draw do
  root to: 'games#new'

  get '/register', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :games, only: [:index, :new, :create]

  resources :cards, only: [:new, :create, :edit, :update, :index]

  resources :expansions, except: [:destroy]

  resources :henchmen, except: [:destroy]

  resources :heros, except: [:destroy]

  resources :masterminds, except: [:destroy]

  resources :scenarios, except: [:destroy]

  resources :users, only: [:show, :create, :edit, :update]

  resources :villains, except: [:destroy]

end