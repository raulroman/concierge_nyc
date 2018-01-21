class V1::ShiftsController < ApplicationController
  # before_action :authenticate_admin
  # before_action :view_shift_request, only: [:index]

  def index
    shifts = Shift.all
    render json: shifts.as_json
  end
  
  def show
    shift = Shift.find_by(id: params[:id])
    render json: shift.as_json
  end

  def create
    shift = Shift.new(
    full_time_employee_id: params[:full_time_employee_id],
    day_of_the_week: params[:day_of_the_week],
    date: params[:date],
    start_time: params[:start_time],
    end_time: params[:end_time],
    position: params[:position],
    building_id: params[:building_id],
    approved_denied: params[:approved_denied],
    approved_at: params[:approved_at],
    claimed_by_employee_id: params[:claimed_by_employee_id],
    relief_type: params[:relief_type]
    )
    if shift.save
      render json: shift.as_json
    else
      render json: { errors: shift.error_full_messages}
    end
  end

  def update
    shift = Shift.find_by(id: params[:id])
    
    shift.update(
    full_time_employee_id: params[:full_time_employee_id],
    day_of_the_week: params[:day_of_the_week],
    date: params[:date],
    start_time: params[:start_time],
    end_time: params[:end_time],
    position: params[:position],
    building_id: params[:building_id],
    approved_denied: params[:approved_denied],
    approved_at: params[:approved_at],
    claimed_by_employee_id: params[:claimed_by_employee_id],
    relief_type: params[:relief_type])
  end

  def self.make_shift_public

    
  end

  def destroy
    shift = Shift.find_by(id: params[:id])
    shift.destroy
    render json: { message: "You deleted the shift"
     } 
  end
end

    
