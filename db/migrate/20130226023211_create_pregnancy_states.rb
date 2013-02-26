class CreatePregnancyStates < ActiveRecord::Migration
  def change
    create_table :pregnancy_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
