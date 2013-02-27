class CreateViolenceKinds < ActiveRecord::Migration
  def change
    create_table :violence_kinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
