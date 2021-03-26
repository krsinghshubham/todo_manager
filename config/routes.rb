Rails.application.routes.draw do
  get "/", to: "todos#index"

  resources :todos #using resources we need not to define the indivisual routes as we did below.
  get "todos", to: "todos#index" #for get_type_request <url_name>, route it to todos(defined by todos_controller, as naming convention), there define what index does)
end
# routes first check in public folder if todos.html available or not. If not it will go to contoller(here todos_controller) and there find the method .