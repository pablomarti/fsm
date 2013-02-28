class CreateHumanConditions < ActiveRecord::Migration
  def change
    create_table :human_conditions do |t|
      t.string :name

      t.timestamps
    end
  end
end
