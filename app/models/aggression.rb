class Aggression < ActiveRecord::Base
  
  belongs_to :aggression_kind
  belongs_to :system_case
  has_many :human_record_aggressions
  
  attr_accessible :name

end
