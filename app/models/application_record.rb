class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

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
