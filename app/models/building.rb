class Building < ActiveRecord::Base
  belongs_to :user
  belongs_to :dashboard
  belongs_to :company_type
  belongs_to :country
  has_many :laboratory
  
  validates :name, presence: true, uniqueness: true
  validates :shortname, presence: true, uniqueness: true
  validates :company_type, presence: true
  validates :country, presence: true
end
