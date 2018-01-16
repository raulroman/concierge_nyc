class ApplicationController < ActionController::API
  include Knock::Authenticable

  def authenticate_admin
    if current_user && current_user.admin > 3
    
     else
      render json: {}
    end
  end
end
