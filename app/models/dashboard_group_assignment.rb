class DashboardGroupAssignment < ActiveRecord::Base
  belongs_to :group
  belongs_to :dashboard
  belongs_to :dashboard_role

  validates :group, presence: true, uniqueness: false
  validates :dashboard, presence: true, uniqueness: false
  validates :dashboard_role, presence: true, uniqueness: false
end
