class V1::ShiftsController < ApplicationController
  before_action :authenticate_admin
  before_action :view_shift_request, only: [:index, :show]

  def index
    shifts = Shift.all
    render json: shifts.as_json
  end
  
  def show
    shifts = Shift.where(approved_denied:false)
    render json: shifts.as_json
  end

  def create
    if current_user.admin == 2 || current_user.admin == 3
      shift = Shift.new(
      full_time_employee_id: current_user.id,
      day_of_the_week: params[:day_of_the_week],
      date: params[:date],
      start_time: params[:start_time],
      end_time: params[:end_time],
      position: params[:position],
      building_id: current_user.building_id,
      approved_denied: false,
      claimed_by_employee_id: 0,
      relief_type: params[:relief_type]
      )
      if shift.save
        client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_AUTH_TOKEN"]
          
        client.api.account.messages.create(
          from: ENV["TWILIO_NUMBER"],
          to: ENV["CELL_NUMBER"], 
          body: "Testing!"
        )
      #   render json: shift.as_json
      # else
      #   render json: { errors: shift.error_full_messages}
      end
    end
  end

  def update
    shift = Shift.find_by(id: params[:id])

    if current_user.admin == 1
      shift.update(
      claimed_by_employee_id: current_user.id,
      relief_type: current_user.admin
      )

    elsif current_user.admin == 2
      shift.update(
      claimed_by_employee_id: current_user.id,
      relief_type: current_user.admin
      )

    elsif current_user.admin == 3
      shift.update(    
      approved_denied: true,
      approved_at: Time.now
    )
      if shift.save 
        render json: shift.as_json
      else
        render json: { message: shift.errors.full_messages }
      end
    end
  end


  def destroy
    shift = Shift.find_by(id: params[:id])
    shift.destroy
    render json: { message: "You deleted the shift"
     } 
  end
end

    
