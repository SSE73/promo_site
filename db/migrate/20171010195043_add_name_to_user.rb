class AddNameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false, uniq: true
    add_column :users, :moderator, :boolean, null: false, default: false
    add_column :users, :creator, :boolean, null: false, default: false
    add_column :users, :active, :boolean, null: false, default: true
    add_index :users, :name, unique: true
  end
end
