class DashboardRole < ActiveRecord::Base
  has_many :dashboard_assignments
  
  validates :name, presence: true, uniqueness: true
end
