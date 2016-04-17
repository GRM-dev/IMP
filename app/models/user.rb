class User < ActiveRecord::Base
  has_secure_password
  
    def is_admin
    self.permission_level >= 4
  end
  
  validates :email, presence: true, uniqueness: true
  validates :visible_name, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :permission_level, presence: true
  
end
