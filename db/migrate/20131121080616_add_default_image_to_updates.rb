class AddDefaultImageToUpdates < ActiveRecord::Migration
  def change
  	change_column :updates, :image_file, :string, default: 'updates/default.png'
	end
end
