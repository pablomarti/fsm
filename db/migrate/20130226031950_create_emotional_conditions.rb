class CreateEmotionalConditions < ActiveRecord::Migration
  def change
    create_table :emotional_conditions do |t|
      t.string :name

      t.timestamps
    end
  end
end
