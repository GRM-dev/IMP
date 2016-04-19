class Laboratory < ActiveRecord::Base
  belongs_to :building
  has_many :workstation
  
  validates :building, presence: true
end
