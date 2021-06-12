class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :quantity
      t.string :unit
      t.string :item
      t.string :notes
      t.belongs_to :recipe, foreign_key: true

      t.timestamps
    end
  end
end
