class RemoveLevelIdFromRoles < ActiveRecord::Migration
  def up
    remove_column :roles, :level_id
  end

  def down
    add_column :roles, :level_id, :integer
  end
end
