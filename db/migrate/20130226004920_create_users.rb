class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :level
      t.string :name
      t.string :last_name
      t.boolean :active, :default => true

      t.timestamps
    end
    add_index :users, :level_id
  end
end
