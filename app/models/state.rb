class State < ActiveRecord::Base
  
  has_many :cities

  attr_accessible :name
  attr_accessible :cities_attributes

  accepts_nested_attributes_for :cities, allow_destroy: true
  validates :name,  :presence => true, :uniqueness => true
  
end
