class CreateDiagnosisEmotionalConditions < ActiveRecord::Migration
  def change
    create_table :diagnosis_emotional_conditions do |t|
      t.references :emotional_condition
      t.references :diagnosis

      t.timestamps
    end
    add_index :diagnosis_emotional_conditions, :emotional_condition_id
    add_index :diagnosis_emotional_conditions, :diagnosis_id
  end
end
