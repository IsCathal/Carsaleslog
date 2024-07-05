class Sale < ApplicationRecord

  validates :carModel, presence: true,
                  length: {minimum: 3, maximum: 20}

  validates :salesDate, presence: true, 
                          length: {minimum: 10, maximum: 300} 

  validates :fuelType, presence: true
                                   
end