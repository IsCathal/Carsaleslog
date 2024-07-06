class Sale < ApplicationRecord
  belongs_to :salesperson

  validates :carModel, presence: true,
                  length: {minimum: 3, maximum: 20}

  validates :salesDate, presence: true, 
                          length: {minimum: 10, maximum: 300} 

  validates :fuelType, presence: true

  # "Owned by #{user.name}" if user_id.to_i != 0


  def best_seller
    # if salesperson.salesNumber is best

  end
                                   
end