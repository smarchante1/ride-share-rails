Rails.application.routes.draw do

  # root to: "passengers#index" #REMEMBER TO CHANGE THIS TO HOMEPAGE

  # Routes for trips # cut down some of these using only syntax
  resources :trips

  # Routes for drivers
  resources :drivers do
    resources :trips, only: [:index]
  end

  # Routes for passengers
  resources :passengers do
    resources :trips, only: [:index, :new]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
