class RemoveUnusedColumnsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :email
    remove_column :users, :image
    remove_column :users, :name
  end
end
