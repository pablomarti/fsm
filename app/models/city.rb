class City < ActiveRecord::Base
  
  belongs_to :state
  has_many :system_cases
  has_many :human_records
  
  attr_accessible :name, :state_id

end
