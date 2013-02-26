class DiagnosisPsychoPhysioAlteration < ActiveRecord::Base
  belongs_to :psycho_physio_alteration
  belongs_to :diagnosis
  # attr_accessible :title, :body
end
