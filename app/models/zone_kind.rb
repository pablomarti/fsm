class ZoneKind < ActiveRecord::Base

  has_many :system_cases
  
  attr_accessible :name

end
