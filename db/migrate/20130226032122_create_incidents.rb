class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.references :incident_kind
      t.references :system_case

      t.timestamps
    end
    add_index :incidents, :incident_kind_id
    add_index :incidents, :system_case_id
  end
end
