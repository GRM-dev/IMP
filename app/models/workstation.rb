class Workstation < ActiveRecord::Base
  belongs_to :laboratory

  validates :name, presence: true
  validates :number, presence: true, uniqueness: {scope: :laboratory_id}
end
