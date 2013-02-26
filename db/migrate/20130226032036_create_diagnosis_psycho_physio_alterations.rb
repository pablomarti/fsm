class CreateDiagnosisPsychoPhysioAlterations < ActiveRecord::Migration
  def change
    create_table :diagnosis_psycho_physio_alterations do |t|
      t.references :psycho_physio_alteration
      t.references :diagnosis

      t.timestamps
    end
    add_index :diagnosis_psycho_physio_alterations, :psycho_physio_alteration_id, :name => :dppa_ppa_id
    add_index :diagnosis_psycho_physio_alterations, :diagnosis_id, :name => :dppa_d_id
  end
end
