class LaboratoriesAssignment < ActiveRecord::Base
  belongs_to :lab_assignable, polymorphic: true
  belongs_to :laboratory
  belongs_to :lab_role

end
