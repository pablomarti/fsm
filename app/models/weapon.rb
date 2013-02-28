class Weapon < ActiveRecord::Base
  
  belongs_to :weapon_kind
  belongs_to :aggressor
  
  attr_accessible :weapon_kind_id, :aggressor_id

end
