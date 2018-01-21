class ApplicationController < ActionController::API
  include Knock::Authenticable

  def authenticate_admin
    if current_user.admin <= 4
    else
      render json: {}
    end
  end

  def view_shift_request
    if current_user.admin == 0
      shifts = Shift.where(approved_denied: true )
      render json: shifts.as_json 

    elsif current_user.admin > 2
      shifts = Shift.where(approved_denied: nil)
      render json: shifts.as_json
      
    elsif current_user.admin == 1
      shifts = Shift.all
      render json: shifts.as_json 
    else
      render json: {}

    end    
  end
end
