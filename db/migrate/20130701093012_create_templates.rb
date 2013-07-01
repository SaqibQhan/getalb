class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :title
      t.integer :width
      t.integer :height
      t.timestamps
    end
  end
end
