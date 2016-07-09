class Group < ActiveRecord::Base
  has_one :dashboard_assignment, as: :assignable
  has_one :dashboard, through: :dashboard_assignment
  has_many :laboratories_assignments, as: :lab_assignable
  has_many :users_groups
  has_many :users, through: :users_groups

  validates :name, presence: true, uniqueness: false
  validates :dashboard_assignment, presence: true, uniqueness: false
end
