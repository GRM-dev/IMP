class ActiveWidget < ActiveRecord::Base
  belongs_to :dashboard_user_setting
  belongs_to :widget
  
  validates :widget_id, presence: true
  validates :dashboard_user_settings_id, presence: true
end
