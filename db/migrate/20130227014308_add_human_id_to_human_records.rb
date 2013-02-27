class AddHumanIdToHumanRecords < ActiveRecord::Migration
  def change
    add_column :human_records, :human_id, :integer
  end
end
