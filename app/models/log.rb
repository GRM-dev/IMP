class Log < ActiveRecord::Base
  belongs_to :user
  belongs_to :log_type

  validates :log, presence: true
  validates :category, presence: true
end
