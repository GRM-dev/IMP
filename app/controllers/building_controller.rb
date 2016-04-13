class BuildingController < ApplicationController
  
  def new
    @building = Building.new
  end
  
  def create
    @building = Building.new(building_params)
    dashboard = Dashboard.create
    @building.dashboard_id = dashboard.id
    @building.user_id = current_user.id
    respond_to do |format|
      if @building.save
        format.html {redirect_to dashboard_path}
        format.js {}
      else
        format.html {render :new}
        format.js {render json: @building.errors, status: :unprocessable_entity}
      end
    end
  end
  
  private
  def building_params
    params.require(:building).permit(:id, :name, :street, :city, :shortname, :company_type_id)
  end
end
