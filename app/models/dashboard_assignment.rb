class DashboardAssignment < ActiveRecord::Base
  belongs_to :dashboard
  belongs_to :assignable, polymorphic: true
  belongs_to :dashboard_user_setting
  belongs_to :dashboard_role
  belongs_to :dashboard_permission

  before_validation :default_values
 
  validates :dashboard, presence: true
  validates :dashboard_user_setting, presence: true
  validates :dashboard_role, presence: true
  validates :dashboard_permission, presence: true
  
  def default_values
    self.dashboard_role ||= DashboardRole.find_by_name('spectator')
    self.dashboard_permission ||= DashboardPermission.create
    self.dashboard_user_setting ||= DashboardUserSetting.create
  end
end
