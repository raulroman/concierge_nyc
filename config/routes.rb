Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :v1 do 
    
    get "/shifts" => "shifts#index"
    get "/shifts/new" => "shifts#new"
    post "/shifts" => "shifts#create"
    get "/shifts/shift" => "shifts#show"
    get "/shifts/:id/edit" => "shifts#edit"
    patch "/shifts/:id" => "shifts#update"
    delete "/shifts/:id" => "shifts#destroy"

    post "/users" => "users#create"

    get "/buildings" => "buildings#index"
    post "/buildings" => "buildings#create"
  end
end
