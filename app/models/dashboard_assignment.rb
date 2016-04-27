class DashboardAssignment < ActiveRecord::Base
  belongs_to :dashboard
  belongs_to :user
  belongs_to :dashboard_user_setting
  belongs_to :dashboard_role
  
  validates :dashboard, presence: true
  validates :user, presence: true
  validates :dashboard_user_setting, presence: true
  validates :dashboard_role, presence: true
end
