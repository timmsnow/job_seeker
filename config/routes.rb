Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    #user routes
    post "/users" => "users#create"

    #job routes
    get "/jobs" => "jobs#index"
    get "/jobs/:id" => "jobs#show"
    post "/jobs" => "jobs#create"
    patch "/jobs/:id" => "jobs#update"
    delete "/jobs/:id" => "jobs#destroy"


    #session routes
    post "/sessions" => "sessions#create"
    end


end
