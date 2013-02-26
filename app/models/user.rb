class User < ActiveRecord::Base
  
  belongs_to :level
  has_many :user_roles
  has_many :roles, :through => :user_roles
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me 
  attr_accessible :active, :last_name, :name, :level_id
  
  def full_name
  	name + " " + last_name
  end

  def role?(role_sym)
  	roles.has_role?(role_sym)
  end

  def has_level?(level_name)
    level.name == level_name rescue false
  end

end
