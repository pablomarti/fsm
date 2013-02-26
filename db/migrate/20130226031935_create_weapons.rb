class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.references :weapon_kind
      t.references :aggressor

      t.timestamps
    end
    add_index :weapons, :weapon_kind_id
    add_index :weapons, :aggressor_id
  end
end
