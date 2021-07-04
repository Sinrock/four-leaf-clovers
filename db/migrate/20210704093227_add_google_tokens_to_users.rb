class AddGoogleTokensToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :google_token, :string
    add_index :users, :google_token
    add_column :users, :google_refresh_token, :string
    add_index :users, :google_refresh_token
  end
end
