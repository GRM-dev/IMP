class DashboardController < ApplicationController
  before_action :require_user
  #before_action :dashboard_installed
  
  def index
    @users = User.all
  end
  
  private
   def dashboard_installed
    if Dashboard.all.empty?
      redirect_to '/dashboard/install'
    end
  end
end
