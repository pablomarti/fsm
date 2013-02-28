class AddAggressionCaseIdToHumanRecords < ActiveRecord::Migration
  def change
    add_column :human_records, :aggression_case_id, :integer, :default => 0
  end
end
