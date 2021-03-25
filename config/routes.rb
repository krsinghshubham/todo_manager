Rails.application.routes.draw do
  get "/", to: "todos#index"

  resources :todos #using resources we need not to define the indivisual routes.
  #get "todos", to: "todos#index" #for get_type_request <url_name>, route it to todos(defined by todos_controller, as naming convention), there define what index does)
end