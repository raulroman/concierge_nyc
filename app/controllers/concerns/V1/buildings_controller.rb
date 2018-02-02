class V1::BuildingsController < ApplicationController

  def index
    buildings = Building.all
    render json: buildings.as_json
  end

  def show
    building = Building.all
    render json: building.as_json
    
  end

  def create
    building = Building.new(
        name: params[:name],
        address: params[:address]
        )
    if building.save
      render json: building.as_json
    else
      render json: { errors: building.errors.full_messages}
    end
  end
end
