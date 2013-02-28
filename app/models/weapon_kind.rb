class WeaponKind < ActiveRecord::Base
  
  has_many :weapons
  
  attr_accessible :name
  
end
