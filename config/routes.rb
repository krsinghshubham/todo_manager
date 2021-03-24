Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "todos", to: "todos#index" #for get-requst todo, route it to todos(defined by todos_controller, there define what index does)
  get "todos/:id", to: "todos#show" #will define how the show will work in todos_controller
end
