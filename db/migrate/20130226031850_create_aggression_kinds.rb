class CreateAggressionKinds < ActiveRecord::Migration
  def change
    create_table :aggression_kinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
