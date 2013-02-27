class CreateDiagnoses < ActiveRecord::Migration
  def change
    create_table :diagnoses do |t|
      t.references :human_record
      t.boolean :physical_disability, :default => false
      t.boolean :mental_disability, :default => false
      t.text :diagnosis_description
      t.boolean :violence_witness, :default => false
      t.boolean :sexual_assault_antecedent, :default => false

      t.timestamps
    end
    add_index :diagnoses, :human_record_id
  end
end
