class Level < ActiveRecord::Base
  
  has_many :users
  has_many :level_roles
  has_many :roles, :through => :level_roles

  attr_accessible :name
  validates :name, :presence => true, :uniqueness => true
  
end
