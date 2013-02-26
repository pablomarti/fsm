class CreateOcupations < ActiveRecord::Migration
  def change
    create_table :ocupations do |t|
      t.string :name

      t.timestamps
    end
  end
end
