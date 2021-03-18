Rails.application.routes.draw do
  resources :clients
  resources :pets do
    #resources :histories, only: [:index, :create, :new]
    #resources :histories, shallow: true 
    resources :histories
  end
    root 'pets#index'
  #resources :histories, exept: [:index, :create, :new]
end
