class AddGoogleTokensToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :google_token
    add_index :users, :google_refresh_token
  end
end
