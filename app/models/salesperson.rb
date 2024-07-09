class Salesperson < ApplicationRecord
  has_many :sales

  validates :firstName, presence: true,
                  length: {minimum: 3, maximum: 20}

  validates :lastName, presence: true, 
                          length: {minimum: 3, maximum: 20} 


  def display_first_last
    if salesNumber == top_seller  && Salesperson.count > 1
      "#{firstName} #{lastName} (Best salesperson)"
    else
       "#{firstName} #{lastName}"
    end
  end
                                   
end
