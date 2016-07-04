class UsersAvatar < ActiveRecord::Base
  belongs_to :avatar
  belongs_to :user

  validates :avatar, presence: true
  validates :user, presence: true
end
