TodoComponent::Engine.routes.draw do
  root to: "dashboard#index"
  resources :dashboard, only: %i[index new create]
end
