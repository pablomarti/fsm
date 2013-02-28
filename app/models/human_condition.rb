class HumanCondition < ActiveRecord::Base

  has_many :aggressor_human_conditions

  attr_accessible :name
  
end
