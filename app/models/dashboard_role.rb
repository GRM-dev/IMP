class DashboardRole < ActiveRecord::Base
  has_many :dashboard_assignment
  
  validates :name, presence: true, uniqueness: true
end
