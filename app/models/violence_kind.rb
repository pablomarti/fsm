class ViolenceKind < ActiveRecord::Base

  has_many :human_records

  attr_accessible :name
  
end