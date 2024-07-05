class Salesperson < ApplicationRecord
  has_many :sales

  validates :firstName, presence: true,
                  length: {minimum: 3, maximum: 20}

  validates :lastName, presence: true, 
                          length: {minimum: 3, maximum: 20} 

  validates :salesNumber, presence: true
                                   
end
