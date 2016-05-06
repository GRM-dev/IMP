class DashboardController < ApplicationController
  before_action :require_user
  before_action :dashboard_installed
  
  has_widgets do |root|
      root << widget(:weather)
  end
  
  def index
  end
  
  private
   def dashboard_installed
    if !Building.where(user_id: current_user.id)
      redirect_to '/'+params[:locale]+'/dashboard/install'
    end
   end
end
