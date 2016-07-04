class LaboratoriesAssignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :laboratory
  belongs_to :lab_role

end
