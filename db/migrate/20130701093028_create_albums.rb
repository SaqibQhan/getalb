class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :user
      t.string :title
      t.integer :num_of_pages
      t.timestamps
    end
  end
end
