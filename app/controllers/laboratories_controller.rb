class Building::LaboratoriesController < ApplicationController
  
  def index
    @laboratories = Laboratory.find_by_building_id(current_building)
    #render layout: false
  end
  
  def new
    @lab = Laboratory.new(lab_params)
  end
  
  def create
    
  end
  
  private
  def lab_params
    params.require(:laboratory).permit(:id, :name)
  end
end
