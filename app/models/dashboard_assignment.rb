class DashboardAssignment < ActiveRecord::Base
  belongs_to :dashboard
  belongs_to :user
  belongs_to :dashboard_user_setting
  belongs_to :dashboard_role
  before_validation :default_values
 
  validates :dashboard, presence: true
  validates :user, presence: true, uniqueness: { :scope => :dashboard }
  validates :dashboard_user_setting, presence: true
  validates :dashboard_role, presence: true
  
  def default_values
    self.dashboard_role ||= DashboardRole.find_by_name('spectator')
    self.dashboard_user_setting ||= DashboardUserSetting.create
  end
end
