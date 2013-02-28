class AggressorHumanCondition < ActiveRecord::Base
  
  belongs_to :aggressor
  belongs_to :human_condition

  attr_accessible :aggressor_id, :human_condition_id

end
