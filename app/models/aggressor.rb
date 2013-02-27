class Aggressor < ActiveRecord::Base
  belongs_to :human_record
  belongs_to :physical_condition
  attr_accessible :aftermath_war, :prior_criminal, :sexual_assault_antecedent, :violence_witness
end
