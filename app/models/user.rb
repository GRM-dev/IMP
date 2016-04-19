class User < ActiveRecord::Base
  has_secure_password
  
  def is_noble # dashboard user with some more privilages
    is_dashboard_admin || self.permission_level == 1
  end
  
  def is_dashboard_admin # can create own dashboard
    is_mod || self.permission_level == 2
  end
  
  def is_mod
    is_admin || self.permission_level == 3
  end
  
  def is_admin
    is_hadmin || self.permission_level == 4
  end
  
  def is_hadmin
    self.permission_level == 5
  end
  
  validates :email, presence: true, uniqueness: true
  validates :visible_name, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :permission_level, presence: true
  validates :image_file, presence: true
  
end
