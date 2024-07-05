class CreateSalesperson < ActiveRecord::Migration[7.1]
  def change
    create_table :salespeople do |t|
      t.string :firstName
      t.string :lastName
      t.integer :salesNumber
      t.timestamps
    end
  end
end
