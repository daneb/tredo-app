Rails.application.routes.draw do
  mount TodoComponent::Engine => "/todo_component"
end
