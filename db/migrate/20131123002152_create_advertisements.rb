class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
			t.string 	:title
			t.integer :position
			t.boolean :active
			t.string 	:caption
			t.boolean :display_caption
			t.string 	:image_file
			t.string	:link_to

      t.timestamps
    end

		add_index :advertisements, :active
  end
end
