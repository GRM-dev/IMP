class Avatar < ActiveRecord::Base
  
  validates :url, presence: true
end
