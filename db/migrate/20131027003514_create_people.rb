class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :position
      t.text :biography
      t.string :image_file

      t.timestamps
    end
  end
end
