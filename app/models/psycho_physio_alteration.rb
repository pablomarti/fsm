class PsychoPhysioAlteration < ActiveRecord::Base
	has_many :diagnosis_emotional_conditions
  	has_many :diagnoses,:through=>:diagnosis_psycho_physio_alterations
  	attr_accessible :name
  attr_accessible :name
  validates :name,  :presence => true, :uniqueness => true
end
