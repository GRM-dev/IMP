class Building < ActiveRecord::Base
  belongs_to :user
  belongs_to :dashboard
  belongs_to :company_type
  
  accepts_nested_attributes_for :company_type
  
  validates :name, presence: true, uniqueness: true
  validates :shortname, presence: true, uniqueness: true
  validates :city, presence: true
  validates :street, presence: true
  validates :company_type, presence: true
end
