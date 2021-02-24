class CreateAuthoredComments < ActiveRecord::Migration[5.2]
  def change
    create_table :authored_comments do |t|

      t.timestamps
    end
  end
end
