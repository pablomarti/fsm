class Diagnosis < ActiveRecord::Base
  belongs_to :human_record
  attr_accessible :diagnosis_description, :mental_disability, :physical_disability, :sexual_assault_antecedent, :violence_witness
end
