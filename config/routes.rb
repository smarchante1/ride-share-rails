Rails.application.routes.draw do
  root to: "drivers#index" #REMEMBER TO CHANGE THIS TO HOMEPAGE

  get "/drivers", to: "drivers#index", as: "drivers" #index

  get "/drivers/new", to: "drivers#new", as: "new_driver"
  post "/drivers", to: "drivers#create"

  get "/drivers/:id", to: "drivers#show", as: "driver" #show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
