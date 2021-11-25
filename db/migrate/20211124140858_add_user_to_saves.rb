class AddUserToSaves < ActiveRecord::Migration[6.1]
  def change
    add_reference :saves, :user, null: false, foreign_key: true
  end
end
