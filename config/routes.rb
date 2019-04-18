Rails.application.routes.draw do

  # root to: "homepage#index"
  resources :homepage
  resources :drivers
  # Routes for trips # cut down some of these using only syntax
  resources :trips

  # Routes for drivers

  # Routes for passengers
  resources :passengers do
    resources :trips
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
