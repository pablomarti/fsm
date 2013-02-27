class CreateHumanRecords < ActiveRecord::Migration
  def change
    create_table :human_records do |t|
      t.references :educational_level
      t.references :civil_state
      t.references :pregnancy_state
      t.references :ocupation
      t.references :city
      t.references :violence_kind

      t.timestamps
    end
    add_index :human_records, :educational_level_id
    add_index :human_records, :civil_state_id
    add_index :human_records, :pregnancy_state_id
    add_index :human_records, :ocupation_id
    add_index :human_records, :city_id
    add_index :human_records, :violence_kind_id
  end
end
