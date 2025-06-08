class CreateFriends < ActiveRecord::Migration[8.0]
  def change
    create_table :friends do |t|
      t.string :firstName
      t.string :lastName
      t.integer :phone
      t.string :gender

      t.timestamps
    end
  end
end
