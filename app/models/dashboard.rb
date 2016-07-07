class Dashboard < ActiveRecord::Base
  has_one :building
  has_many :dashboard_assignments
  has_many :users, through: :dashboard_assignments, as: :assignable
  
  def assignments_for_user(user)
    dashboard_assignments
  end
end
