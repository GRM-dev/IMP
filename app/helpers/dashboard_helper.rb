module DashboardHelper
  
  def current_dashboard_assignments
    DashboardAssignment.where(dashboard: current_dashboard)
  end
end
