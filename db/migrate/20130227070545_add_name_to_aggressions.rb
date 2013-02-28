class AddNameToAggressions < ActiveRecord::Migration
  def change
    add_column :aggressions, :name, :string
  end
end
