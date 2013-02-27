class AddStateToHumanRecords < ActiveRecord::Migration
  def change
    add_column :human_records, :state, :string
  end
end
