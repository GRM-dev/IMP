class CompanyType < ActiveRecord::Base
  has_many :building
  
  validates :name, presence: true, uniqueness: true
end
