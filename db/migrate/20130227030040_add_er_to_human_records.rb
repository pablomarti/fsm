class AddErToHumanRecords < ActiveRecord::Migration
  def change
    add_column :human_records, :er, :boolean, :default => false
  end
end
