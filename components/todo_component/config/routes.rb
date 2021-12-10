TodoComponent::Engine.routes.draw do
  root to: "dashboard#index"
  get "/todo/new", to: "dashboard#new"
  post "/todo", to: "dashboard#create"
end
