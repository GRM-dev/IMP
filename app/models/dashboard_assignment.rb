class DashboardAssignment < ActiveRecord::Base
  has_one :dashboard
  has_one :user
  has_one :dashboard_user_setting
  has_one :dashboard_role
  
  validates :dashboard, presence: true
  validates :user, presence: true
  validates :dashboard_user_setting, presence: true
  validates :dashboard_role, presence: true
end
