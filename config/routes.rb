Rails.application.routes.draw do
  resources :charts
  resources :appointments
  resources :vets
  resources :pets
  resources :owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
