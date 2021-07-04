class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.string :affected_person
      t.string :email
      t.string :location
      t.string :password_digest
      t.string :google_token
      t.string :google_refresh_token

      t.timestamps
    end
  end
end
