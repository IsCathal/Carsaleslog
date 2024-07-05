class Salesperson < ApplicationRecord

  validates :firstName, presence: true,
                  length: {minimum: 3, maximum: 20}

  validates :lastName, presence: true, 
                          length: {minimum: 3, maximum: 20} 

  validates :salesNumber, presence: true
                                   
end
