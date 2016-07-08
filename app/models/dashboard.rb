class Dashboard < ActiveRecord::Base
  has_one :building
  has_many :dashboard_assignments, -> { where(assignable_type: 'User') }, class_name: 'DashboardAssignment'
  has_many :users, through: :dashboard_assignments, source: :assignable, source_type: "User"
  has_many :groups, through: :dashboard_assignments, source: :assignable, source_type: "Group"
  
  def assignments_for_user(user)
    dashboard_assignments
  end
end
