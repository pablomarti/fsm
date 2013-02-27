class CreateAggressors < ActiveRecord::Migration
  def change
    create_table :aggressors do |t|
      t.references :human_record
      t.references :physical_condition
      t.boolean :prior_criminal, :default => false
      t.boolean :aftermath_war, :default => false
      t.boolean :violence_witness, :default => false
      t.boolean :sexual_assault_antecedent, :default => false

      t.timestamps
    end
    add_index :aggressors, :human_record_id
    add_index :aggressors, :physical_condition_id
  end
end
