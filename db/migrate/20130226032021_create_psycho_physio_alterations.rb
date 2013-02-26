class CreatePsychoPhysioAlterations < ActiveRecord::Migration
  def change
    create_table :psycho_physio_alterations do |t|
      t.string :name

      t.timestamps
    end
  end
end
