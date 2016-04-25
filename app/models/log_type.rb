class LogType < ActiveRecord::Base
  
  validates :name, prence: true, uniqueness: true
  validates :rank, presence: true, uniqueness: true
end
