class CreateCiders < ActiveRecord::Migration
  def change
    create_table :ciders do |t|
      t.string :name
      t.text :description
      t.string :image_file
      t.string :season

      t.timestamps
    end
  end
end
