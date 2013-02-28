class CreateAggressionCases < ActiveRecord::Migration
  def change
    create_table :aggression_cases do |t|
      t.string :name

      t.timestamps
    end
  end
end
