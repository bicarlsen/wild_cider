class AddIndexPostAtToUpdates < ActiveRecord::Migration
  def change
  	add_index :updates, :post_at
	end
end
