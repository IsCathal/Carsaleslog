class AddSalesperonToSales < ActiveRecord::Migration[7.1]
  def change
    add_column :sales, :salesperson_id, :int
  end
end
