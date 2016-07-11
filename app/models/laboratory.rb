class Laboratory < ActiveRecord::Base
  belongs_to :building
  has_many :workstations
  
  validates :name, presence: true
  validates :building, presence: true
end
