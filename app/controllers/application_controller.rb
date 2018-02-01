class ApplicationController < ActionController::API
  include Knock::Authenticable

  def authenticate_admin
    if current_user.admin
    else
      render json: {}
    end

    # def authenticate_current_user
    #   if current_user
      
    # end
  end

  def view_shift_request
    if current_user.admin == 1
      shifts = Shift.where(approved_denied: true).where(claimed_by_employee_id: 0 ).where("approved_at < ? ", 2.minutes.ago).where("building_id <= ?", 4 )

      render json: shifts.as_json

    elsif current_user.admin == 2
      shifts = Shift.where(approved_denied: true).where(claimed_by_employee_id: 0).where(building_id:current_user.building_id)
      render json: shifts.as_json 
      
    elsif current_user.admin == 3
      shifts = Shift.where(approved_denied:nil).where(building_id: current_user.building_id)
      render json: shifts.as_json
        
    else current_user
         render json: {}
    end    
  end
end