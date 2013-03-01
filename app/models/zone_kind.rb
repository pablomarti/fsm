class ZoneKind < ActiveRecord::Base

  has_many :system_cases
  
  attr_accessible :name
  validates :name,  :presence => true, :uniqueness => true
end
