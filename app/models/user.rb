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

  after_save :assign_user_roles

  def assign_user_roles
    user_roles.destroy_all
    
    level.roles.map{ |role|
      UserRole.create!(:user_id => id, :role_id => role.id)
    }
  end
  
  def full_name
  	name + " " + last_name
  end

  def role?(role_sym)
  	r = roles.has_role?(role_sym)
    puts "HAS SYM #{role_sym}? #{r}"
    return r
  end

  def has_level?(level_name)
    level.name == level_name rescue false
  end

end
