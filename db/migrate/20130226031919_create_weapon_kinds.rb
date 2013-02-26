class CreateWeaponKinds < ActiveRecord::Migration
  def change
    create_table :weapon_kinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
