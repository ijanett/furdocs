Rails.application.routes.draw do
  resources :clinics
  resources :charts
  resources :appointments
  resources :vets
  resources :pets
  resources :owners

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
