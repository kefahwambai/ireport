class RemoveUnusedColumnsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :jti
    remove_column :users, :confirmed_at
    remove_column :users, :confirmation_sent_at
    remove_column :users, :confirmation_token
  end
end
