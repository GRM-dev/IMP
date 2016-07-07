class Group < ActiveRecord::Base
  has_one :dashboard_assignment, as: :assignable, class_name: 'DashboardAssignment'
  has_many :laboratories_assignments, as: :lab_assignable

  validates :name, presence: true, uniqueness: false
end
