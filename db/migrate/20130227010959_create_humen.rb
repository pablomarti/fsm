class CreateHumen < ActiveRecord::Migration
  def change
    create_table :humen do |t|
      t.string :name
      t.string :last_name
      t.datetime :birthdate
      t.boolean :sex, :default => false
      t.integer :total_sons
      t.integer :total_daughters

      t.timestamps
    end
  end
end
