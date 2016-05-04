class ActiveWidget < ActiveRecord::Base
  belongs_to :dashboard_user_setting
  belongs_to :widget
  
  validates :widget, presence: true
  validates :dashboard_user_setting, presence: true
end
