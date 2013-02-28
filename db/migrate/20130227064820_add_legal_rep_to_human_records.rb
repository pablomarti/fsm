class AddLegalRepToHumanRecords < ActiveRecord::Migration
  def change
    add_column :human_records, :legal_rep_name, :string
    add_column :human_records, :legal_rep_last_name, :string
  end
end
