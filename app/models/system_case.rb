class SystemCase < ActiveRecord::Base
  
  belongs_to :city
  belongs_to :zone_kind

  attr_accessible :aggression_date, :complaint, :recidivism
  
end
