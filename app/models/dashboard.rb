class Dashboard < ActiveRecord::Base
  has_one :building
  has_many :dashboard_assignments
  has_many :users, through: :dashboard_assignments
end
