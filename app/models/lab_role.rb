class LabRole < ActiveRecord::Base
  belongs_to laboratory_assignment
  
  validates :name, presence: true, uniqueness: true
  validates :rank, presence: true, uniqueness: true
end
