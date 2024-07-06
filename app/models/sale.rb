class Sale < ApplicationRecord
  belongs_to :salesperson

  validates :carModel, presence: true,
                  length: {minimum: 3, maximum: 20}

  validates :salesDate, presence: true, 
                          length: {minimum: 10, maximum: 300} 

  validates :fuelType, presence: true

  def seller_name
    "#{salesperson.firstName} #{salesperson.lastName} #{salesperson.salesNumber} sales" if salesperson_id.to_i != 0
  end

  def update_sales_count
    salesperson.salesNumber += 1 
  end
                                   
end