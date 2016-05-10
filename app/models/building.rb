class Building < ActiveRecord::Base
  belongs_to :user
  belongs_to :dashboard
  belongs_to :company_type
  belongs_to :country
  has_many :laboratory
  
  accepts_nested_attributes_for :country
  
  validates :name, presence: true, uniqueness: true
  validates :shortname, presence: true, uniqueness: true
  validates :company_type, presence: true
  validates :country, presence: true
end
