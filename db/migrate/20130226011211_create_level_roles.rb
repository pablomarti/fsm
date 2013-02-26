class CreateLevelRoles < ActiveRecord::Migration
  def change
    create_table :level_roles do |t|
      t.references :level
      t.references :role

      t.timestamps
    end
    add_index :level_roles, :level_id
    add_index :level_roles, :role_id
  end
end
