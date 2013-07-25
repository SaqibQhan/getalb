class CreateSvgTexts < ActiveRecord::Migration
  def change
    create_table :svg_texts do |t|
      t.references :album
      t.integer :page
      t.text :text
      t.float :x
      t.float :y
      t.boolean :italic
      t.boolean :bold
      t.timestamps
    end
  end
end
