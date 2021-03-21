Rails.application.routes.draw do
  resources :clients
  resources :pets
  resources :histories
  root 'pets#index'
end
