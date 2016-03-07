class Building < ActiveRecord::Base
  belongs_to :user
  belongs_to :dashboard
  belongs_to :company_type
end
