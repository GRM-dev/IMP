class Building < ActiveRecord::Base
  belongs_to :user
  belongs_to :dashboard
  belongs_to :company_type
  belongs_to :country
  has_many :laboratories

  before_validation :default_values
  
  accepts_nested_attributes_for :country
  
  validates :name, presence: true, uniqueness: true
  validates :shortname, presence: true, uniqueness: true
  validates :company_type, presence: true
  validates :country, presence: true

  def default_values
    self.dashboard ||= Dashboard.create
    DashboardAssignment.create(dashboard: dashboard, assignable_id: self.user.id, assignable_type: 'User')
  end
end
