class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.string :carModel
      t.date :salesDate
      t.int :salesNumber

      t.timestamps
    end
  end
end
