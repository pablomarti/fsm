class AddRoleAliasToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :alias, :string
  end
end
