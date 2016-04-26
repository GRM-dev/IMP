class Log < ActiveRecord::Base
  belongs_to :User
  belongs_to :LogType
end
