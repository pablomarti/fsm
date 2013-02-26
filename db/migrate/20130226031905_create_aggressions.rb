class CreateAggressions < ActiveRecord::Migration
  def change
    create_table :aggressions do |t|
      t.references :aggression_kind
      t.references :system_case

      t.timestamps
    end
    add_index :aggressions, :aggression_kind_id
    add_index :aggressions, :system_case_id
  end
end
