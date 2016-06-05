class DashboardGroupAssignment < ActiveRecord::Base
  validates :group, presence: true, uniqueness: false
  validates :dashboard_role, presence: true, uniqueness: false
  validates :dashboard, presence: true, uniqueness: false
end
