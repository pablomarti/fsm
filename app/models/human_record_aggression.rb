class HumanRecordAggression < ActiveRecord::Base
  
  belongs_to :human_record
  belongs_to :aggression

  attr_accessible :human_record_id, :aggression_id

end
