class WeaponKind < ActiveRecord::Base
  
  has_many :weapons
  
  attr_accessible :name
  validates :name,  :presence => true, :uniqueness => true
  
end
