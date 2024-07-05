class Salespersons < ActiveSupport::TestCase 

  def setup
    #add salesPersonAfter
    @sale = Sale.new(carModel: "Opel", salesDate:"01/12/2014", fuelType: "Petrol")
  end

  test "sales should be vaild" do 
    assert @sale.valid?
   end

end