class HumanDocument < ActiveRecord::Base
  
  belongs_to :document_type
  belongs_to :human

  attr_accessible :code, :human_id, :document_type_id

end
