class City < ActiveRecord::Base
  
  belongs_to :state
  has_many :system_cases
  
  attr_accessible :name

end
