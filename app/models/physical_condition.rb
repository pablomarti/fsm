class PhysicalCondition < ActiveRecord::Base
  
  has_many :aggressors

  attr_accessible :name
  
end
