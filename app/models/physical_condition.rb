class PhysicalCondition < ActiveRecord::Base
  
  has_many :aggressors

  attr_accessible :name
  
  validates :name,  :presence => true, :uniqueness => true
end
