Rails.application.routes.draw do
  get 'notifications/index' 


  post 'user_token' => 'user_token#create'
  namespace :v1 do 
    
    get "/shifts" => "shifts#index"
    get "/shifts/new" => "shifts#new"
    post "/shifts" => "shifts#create"
    get "/shifts/shift" => "shifts#show"
    get "/shifts/shift/edit" => "shifts#edit"
    patch "/shifts/:id" => "shifts#update"
    delete "/shifts/:id" => "shifts#destroy"

    get "/users/" => "users#index"
    post "/users" => "users#create"
    get "/users/user" => "users#show"



    get "/buildings" => "buildings#index"
    get "/buildings/info" => "buildings#show"
    post "/buildings" => "buildings#create"
  end
end
