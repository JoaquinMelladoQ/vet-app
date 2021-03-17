Rails.application.routes.draw do
  resources :pets do
    resources :histories, shallow: true 
  end
end
