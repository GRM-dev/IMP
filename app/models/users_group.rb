class UsersGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :user, presence: true, uniqueness: {scope: :group}
  validates :group, presence: true, uniqueness: false
end
