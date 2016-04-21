class Building::LaboratoriesController < ApplicationController
  
  def index
    @laboratories = Laboratory.find_by_building_id(current_building)
    
  end
  
  def new
    
  end
end
