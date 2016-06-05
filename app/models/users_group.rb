class UsersGroup < ActiveRecord::Base

  validates :user, presence: true, uniqueness: false
  validates :group, presence: true, uniqueness: false
end
