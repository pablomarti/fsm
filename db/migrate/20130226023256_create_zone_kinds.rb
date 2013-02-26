class CreateZoneKinds < ActiveRecord::Migration
  def change
    create_table :zone_kinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
