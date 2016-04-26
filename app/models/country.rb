class Country < ActiveRecord::Base
  has_many :buildings
  
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
end
