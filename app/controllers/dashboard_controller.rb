class DashboardController < ApplicationController
  def index
    @dashboards = Dashboard.all
  end
end
