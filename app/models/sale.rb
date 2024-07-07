class Sale < ApplicationRecord
  belongs_to :salesperson

  validates :carModel, presence: true,
                  length: {minimum: 3, maximum: 20}

  validates :salesDate, presence: true, 
                          length: {minimum: 10, maximum: 300} 

  validates :fuelType, presence: true

  def seller_name
    if salesperson.salesNumber == top_seller
      "#{salesperson.firstName} #{salesperson.lastName} #{salesperson.salesNumber} sales (Best salesperson)"
    else
     "#{salesperson.firstName} #{salesperson.lastName} #{salesperson.salesNumber} sales"
    end
  end

  def top_seller

    salespeople = Salesperson.all
    
    top_seller = nil
    highest_sales_number = 0
  
    salespeople.each do |salesperson|
      if salesperson.salesNumber > highest_sales_number
        highest_sales_number = salesperson.salesNumber
        top_seller = salesperson
      end
    end
  
    highest_sales_number if salespeople.count > 0
  end
                                   
end