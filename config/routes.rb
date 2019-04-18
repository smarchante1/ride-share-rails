Rails.application.routes.draw do
  root to: "homepage#index"
  resources :homepage

  resources :drivers

  resources :trips

  resources :passengers do
    resources :trips
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
