class SiteRole < ActiveRecord::Base
  has_many :users
  
  validates :name, presence: true, uniqueness: true
  validates :rank, presence: true, uniqueness: true
end
