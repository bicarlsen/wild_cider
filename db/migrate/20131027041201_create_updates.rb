class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :title
      t.text :description
      t.string :image_file
      t.datetime :post_at

      t.timestamps
    end
  end
end
