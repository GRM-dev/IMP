class Building::LaboratoriesController < ApplicationController
  
  def index
    @labs = current_building.laboratories
    respond_to do |format|
      format.html {render layout: false}
      format.json
    end
  end
  
  def new
    @lab = Laboratory.new
    render layout: false
  end
  
  def create
    @lab = Laboratory.new(lab_params)
    if @lab.save
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end
  
  private
  def lab_params
    r = params.require(:laboratory).permit(:id, :name)
  end
end
