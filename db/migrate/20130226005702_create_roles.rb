class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :level
      t.string :name

      t.timestamps
    end
    add_index :roles, :level_id
  end
end
