class AddAgeToHumen < ActiveRecord::Migration
  def change
    add_column :humen, :age, :integer, :default => 0
  end
end
