class Widget < ActiveRecord::Base
  has_many :dashboard_user_settings, through: :active_widgets
  
  validates :name, presence: true, uniqueness: true
end
