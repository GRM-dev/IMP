class Dashboard < ActiveRecord::Base
  belongs_to :building
  belongs_to :dashboard_assignment
end
