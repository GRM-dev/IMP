class Building::LaboratoriesController < ApplicationController
  
  def index
    @laboratories = Laboratory.all
  end
  
end
