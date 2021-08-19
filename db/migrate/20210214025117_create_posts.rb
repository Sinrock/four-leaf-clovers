class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, index: true
      t.string :body
      

      t.belongs_to :user, foreign_key: true
      t.belongs_to :topic, foreign_key: true
      t.timestamps
    end
  end
end
