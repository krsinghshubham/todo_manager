Rails.application.routes.draw do
  get "/", to: "home#index"

  resources :todos

  resources :users

  get "/signin" => "sessions#new", as:  :new_sessions
  post "/signin" => "sessions#create",  as: :sessions
end

# get "todos", to: "todos#index" #for get_type_request <url_name>, route it to todos(defined by todos_controller, as naming convention), there define what index does)
# routes first check in public folder if todos.html available or not. If not it will go to contoller(here todos_controller) and there find the method .
