class SalesPerson < ActiveSupport::TestCase 

  def setup
    @salesPerson = Salesperson.new(firstName: "Charlie", lastName:"McCabe", salesNumber: 0)
  end

  test "sales should be vaild" do 
    assert @salesPerson.valid?
   end

end