class ViolenceKind < ActiveRecord::Base

  has_many :human_records

  attr_accessible :name
  validates :name,  :presence => true, :uniqueness => true

  def self.all_except_victim
  	where("id <> 1")
  end
  
end
