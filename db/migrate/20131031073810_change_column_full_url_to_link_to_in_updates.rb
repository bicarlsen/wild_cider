class ChangeColumnFullUrlToLinkToInUpdates < ActiveRecord::Migration
  def change
  	rename_column :updates, :full_url, :link_to
	end
end
