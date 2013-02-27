class AddSystemCaseIdToHumanRecords < ActiveRecord::Migration
  def change
    add_column :human_records, :system_case_id, :integer
  end
end
