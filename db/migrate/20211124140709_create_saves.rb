class CreateSaves < ActiveRecord::Migration[6.1]
  def change
    create_table :saves do |t|
      t.string :last_level

      t.timestamps
    end
  end
end
