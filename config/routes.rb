Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :v1 do 
    
    get "/shifts" => "shifts#index"
    get "/shifts/:id" => "shifts#show"
    post "/shifts" => "shifts#create"
    patch "/shifts/:id" => "shifts#update"
    delete "/shifts/:id" => "shifts#destroy"

    post "/users" => "users#create"
  end
end
