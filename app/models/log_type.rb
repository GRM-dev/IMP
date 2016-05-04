class LogType < ActiveRecord::Base
  has_many :log
  
  validates :name, presence: true, uniqueness: true
  validates :rank, presence: true, uniqueness: true
end
