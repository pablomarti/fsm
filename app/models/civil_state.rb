class CivilState < ActiveRecord::Base

  has_many :human_records

  attr_accessible :name
  validates :name,  :presence => true, :uniqueness => true
  
end
