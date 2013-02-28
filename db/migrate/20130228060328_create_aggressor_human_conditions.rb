class CreateAggressorHumanConditions < ActiveRecord::Migration
  def change
    create_table :aggressor_human_conditions do |t|
      t.references :aggressor
      t.references :human_condition

      t.timestamps
    end
    add_index :aggressor_human_conditions, :aggressor_id
    add_index :aggressor_human_conditions, :human_condition_id
  end
end
