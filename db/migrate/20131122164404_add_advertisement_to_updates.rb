class AddAdvertisementToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :advertisement, :integer
		add_index :updates, :advertisement, unique: true
  end
end
