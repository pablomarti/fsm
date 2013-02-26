class CreateEducationalLevels < ActiveRecord::Migration
  def change
    create_table :educational_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
