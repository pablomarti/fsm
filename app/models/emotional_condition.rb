class EmotionalCondition < ActiveRecord::Base
  attr_accessible :name
  has_many :diagnosis_emotional_conditions
  has_many :diagnoses,:through=>:diagnosis_emotional_conditions
end
