class SalesPerson < ActiveSupport::TestCase 

  def setup
    @salesPerson = Salesperson.new(firstName: "Charlie", lastName:"McCabe", salesNumber: 0)
  end

  test "sales person should be vaild" do 
    assert @salesPerson.valid?
   end

   test "firstName should not be too long" do
    @salesPerson.firstName = "a" * 21
    assert_not @salesPerson.valid?
  end

  test "lastName should not be too long" do
    @salesPerson.lastName = "a" * 21
    assert_not @salesPerson.valid?
  end

  test "firstName should not be too short" do
    @salesPerson.firstName = "aa"
    assert_not @salesPerson.valid?
  end

  test "lastName should not be too short" do
    @salesPerson.lastName = "aa"
    assert_not @salesPerson.valid?
  end

end