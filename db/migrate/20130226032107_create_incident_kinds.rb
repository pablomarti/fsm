class CreateIncidentKinds < ActiveRecord::Migration
  def change
    create_table :incident_kinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
