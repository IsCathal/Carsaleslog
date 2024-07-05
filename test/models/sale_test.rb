class Salespersons < ActiveSupport::TestCase 

  def setup
    #add salesPersonAfter
    @salesPerson = Salesperson.create(firstName: "Charlie", lastName:"McCabe", salesNumber: 0)

    @sale = Sale.new(carModel: "Opel", salesDate:"01/12/2014", fuelType: "Petrol", salesperson_id: @salesPerson.id)
  end

  test "sales should be vaild" do 
    assert @sale.valid?
   end

end