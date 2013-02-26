class Role < ActiveRecord::Base
  
  has_many :level_roles
  has_many :levels, :through => :level_roles
  has_many :user_roles

  attr_accessible :name, :alias

  before_save :fix_alias

  def self.has_role?(role_sym)
  	!Role.where(:alias => role_sym.to_s).empty?
  end

  def fix_alias
  	self.alias.downcase.gsub!(/\s+/, "_")
  end

end
