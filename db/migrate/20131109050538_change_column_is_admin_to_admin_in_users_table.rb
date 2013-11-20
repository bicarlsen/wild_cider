class ChangeColumnIsAdminToAdminInUsersTable < ActiveRecord::Migration
  def change
		rename_column :users, :is_admin, :admin
	end
end
