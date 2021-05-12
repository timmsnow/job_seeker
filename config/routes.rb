Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    #user routes
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"

    #job routes
    get "/jobs" => "jobs#index"
    get "/jobs/:id" => "jobs#show"
    post "/jobs" => "jobs#create"
    patch "/jobs/:id" => "jobs#update"
    delete "/jobs/:id" => "jobs#destroy"


    #session routes
    post "/sessions" => "sessions#create"

    # CONTACTS ROUTES
    get "/contacts" => "contacts#index"
    post "/contacts" => "contacts#create" 
    get "/contacts/:id" => "contacts#show"
    patch "/contacts/:id" => "contacts#update"
    delete "/contacts/:id" => "contacts#destroy"

    #METRICTABLE ROUTES
    get "/metric_tables" => "metric_tables#index"
    post "/metric_tables" => "metric_tables#create" 
    get "/metric_tables/:id" => "metric_tables#show"
    patch "/metric_tables/:id" => "metric_tables#update"
    end

    


end
