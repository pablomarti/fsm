class DiagnosisEmotionalCondition < ActiveRecord::Base
  belongs_to :emotional_condition
  belongs_to :diagnosis
  # attr_accessible :title, :body
end
