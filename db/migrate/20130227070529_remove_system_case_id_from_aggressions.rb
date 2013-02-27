class RemoveSystemCaseIdFromAggressions < ActiveRecord::Migration
  def up
    remove_column :aggressions, :system_case_id
  end

  def down
    add_column :aggressions, :system_case_id, :integer
  end
end
