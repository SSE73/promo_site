class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
    add_index :posts, :title, unique: true
  end
end
