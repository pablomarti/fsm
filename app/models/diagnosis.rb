class Diagnosis < ActiveRecord::Base
  belongs_to :human_record
  has_many :diagnosis_emotional_conditions
  has_many :emotional_conditions,:through=>:diagnosis_emotional_conditions

  has_many :diagnosis_psycho_physio_alterations
  has_many :psycho_physio_alterations,:through=>:diagnosis_psycho_physio_alterations

  attr_accessible :diagnosis_description, :mental_disability, 
  				  :physical_disability, :sexual_assault_antecedent, 
  				  :violence_witness, :emotional_condition_ids, :psycho_physio_alteration_ids
end
