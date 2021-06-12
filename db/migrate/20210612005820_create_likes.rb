class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.boolean :liked
      t.belongs_to :recipe, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
