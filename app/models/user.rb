class User < ActiveRecord::Base
  has_secure_password
  belongs_to :site_role
  
  def is_new_user
    is_normal_user || self.site_role == SiteRole.find_by_name('new_user')
  end
  
  def is_normal_user # can create own dashboard
    is_mod || self.site_role == SiteRole.find_by_name('user')
  end
  
  def is_mod
    is_hmod || self.site_role == SiteRole.find_by_name('moderator')
  end
  
  def is_hmod
    is_admin || self.site_role == SiteRole.find_by_name('head_moderator')
  end
  
  def is_admin
    is_hadmin || self.site_role ==SiteRole.find_by_name('administrator')
  end
  
  def is_hadmin
    self.site_role == SiteRole.find_by_name('head_administrator')
  end
  
  validates :visible_name, presence: true, uniqueness: true
  validates :first_name, presence: false, uniqueness: false
  validates :last_name, presence: false, uniqueness: false
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :site_role, presence: true
  
end
