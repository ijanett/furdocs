Rails.application.routes.draw do

  root 'sessions#welcome'

  resources :clinics, only: [:index, :show]
  resources :appointments, only: [:show, :new, :create]
  resources :charts, only: [:new, :create, :edit, :update, :destroy]

  resources :vets, only: [:show, :new, :create] do
    resources :appointments, only: [:show, :new, :create]
    resources :charts, only: [:show, :new, :create, :edit, :destroy]
  end

  resources :pets, only: [:show, :new, :create] do
    resources :appointments, only: [:show, :new, :create]
    resources :charts, only: [:show]
  end

  resources :owners, only: [:show] do
    resources :pets, only: [:show, :new, :create]
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
