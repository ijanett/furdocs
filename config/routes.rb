Rails.application.routes.draw do
  resources :clinics
  resources :charts
  resources :appointments
  resources :vets
  resources :pets
  resources :owners

  get '/login', to: 'sessions#new'
  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
