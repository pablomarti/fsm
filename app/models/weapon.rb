class Weapon < ActiveRecord::Base
  belongs_to :weapon_kind
  belongs_to :aggressor
  # attr_accessible :title, :body
end
