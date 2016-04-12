class Building < ActiveRecord::Base
  belongs_to :user
  belongs_to :dashboard
  belongs_to :company_type
  
  validates :name, presence: true, uniqueness: true
  validates :city, presence: true
  validates :street, presence: true
end
