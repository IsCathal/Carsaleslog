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
                                   
end