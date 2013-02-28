class AggressionCase < ActiveRecord::Base
  
  has_many :human_records
  
  attr_accessible :name

  #Violencia Intrafamiliar, Maltrato a la niñez, Agresion sexual
  
end
