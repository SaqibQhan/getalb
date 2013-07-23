class CreateAlbumDetails < ActiveRecord::Migration
  def change
    create_table :album_details do |t|
      t.references :album
      t.references :template
      t.references :shape
      t.integer :page
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.integer :rotate
      t.float :scale
      t.float :top
      t.float :left
      t.string :image_type
      t.timestamps
    end
  end
end
