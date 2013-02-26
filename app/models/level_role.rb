class LevelRole < ActiveRecord::Base
  
  belongs_to :level
  belongs_to :role

  attr_accessible :level_id, :role_id
  
end
