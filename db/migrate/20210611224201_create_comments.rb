class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :rating
      t.text :content
      t.string :photo
      t.belongs_to :recipe, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
