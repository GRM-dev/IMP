class User < ActiveRecord::Base
  has_secure_password
  belongs_to :site_role
  has_many :buildings
  has_many :laboratories_assignments, as: :lab_assignable
  has_many :dashboards, through: :dashboard_assignments
  
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
    is_hadmin || self.site_role == SiteRole.find_by_name('administrator')
  end
  
  def is_hadmin
    self.site_role == SiteRole.find_by_name('head_administrator')
  end
  
  def current_avatar
    return "default.png"
  end
  
  def public_data_for_dashboard(dashboard)
    visible_name + ' <' + email + '> - ' + I18n.t("dashboard_roles." + dashboard.dashboard_assignments.where(user: self).take.dashboard_role.name)
  end
  
  def assigments_for_dashboard(dashboard)
    as = current_dashboard_assignments
    as.where(user: self).take
  end
  
  validates :visible_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :site_role, presence: true
  validates :age, presence: true
  
end
