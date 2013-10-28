class AddFullUrlToUpdates < ActiveRecord::Migration
  def change
  	change_table :updates do |t|
			t.string :full_url
		end
	end
end
