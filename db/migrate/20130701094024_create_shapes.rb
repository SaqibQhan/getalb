class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.references :template
      t.string :type
      t.integer :x
      t.integer :y
      t.integer :z
      t.integer :r
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
