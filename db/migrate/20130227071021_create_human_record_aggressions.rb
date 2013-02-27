class CreateHumanRecordAggressions < ActiveRecord::Migration
  def change
    create_table :human_record_aggressions do |t|
      t.references :human_record
      t.references :aggression

      t.timestamps
    end
    add_index :human_record_aggressions, :human_record_id
    add_index :human_record_aggressions, :aggression_id
  end
end
