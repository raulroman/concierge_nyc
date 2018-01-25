class ApplicationController < ActionController::API
  include Knock::Authenticable

  def authenticate_admin
    if current_user.admin 
    else
      render json: {}
    end
  end

  def view_shift_request
    if current_user.admin == 2
      shifts = Shift.where(approved_denied: true).where(claimed_by_employee_id: nil ).where("approved_at < ? ", 3.minutes.ago )

      render json: shifts.as_json

    elsif current_user.admin == 3
      shifts = Shift.all
      render json: shifts.as_json 
      
    elsif current_user.admin == 4
      shifts = Shift.where(approved_denied:nil)
      render json: shifts.as_json
    else 
      render json: {}

    end    
  end
end
