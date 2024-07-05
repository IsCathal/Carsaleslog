class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.string :carModel
      t.date :salesDate
      t.string :fuelType

      t.timestamps
    end
  end
end

