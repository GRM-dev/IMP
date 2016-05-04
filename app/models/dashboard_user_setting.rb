class DashboardUserSetting < ActiveRecord::Base
  has_one :dashboard_assignment
  
end
