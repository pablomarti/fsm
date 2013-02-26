class CreatePhysicalConditions < ActiveRecord::Migration
  def change
    create_table :physical_conditions do |t|
      t.string :name

      t.timestamps
    end
  end
end
