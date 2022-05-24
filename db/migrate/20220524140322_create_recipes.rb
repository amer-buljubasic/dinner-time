class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title, index: true
      t.integer :cook_time
      t.integer :prep_time
      t.text :ingredients, array: true, default: []
      t.decimal :ratings, precision: 8, scale: 2
      t.string :cuisine
      t.string :category
      t.string :author
      t.string :image

      t.timestamps
    end
  end
end
