class LabRole < ActiveRecord::Base
  has_many :laboratory_assignments
  
  validates :name, presence: true, uniqueness: true
  validates :rank, presence: true, uniqueness: true
end
