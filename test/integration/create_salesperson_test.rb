require "test_helper"

class CreateSalesPersonTest < ActionDispatch::IntegrationTest

  setup do
    @salesPerson = Salesperson.create(firstName: "Charlie", lastName:"McCabe", salesNumber: 0)
    @sale = Sale.new(carModel: "Opel", salesDate:"01/12/2014", fuelType: "Petrol", salesperson_id: @salesPerson.id)
  end

  test "the new sales form and create sales" do
    get "/sales/new"
    assert_response :success
    assert_difference 'Sale.count', 1 do
      post sales_path, params: { sale: { carModel: "Opel", salesDate:"01/12/2014", fuelType: "Petrol", salesperson_id: @salesPerson.id } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end

  test "the new sales form and reject invalid sales submission" do
    get "/sales/new"
    assert_response :success
    assert_no_difference 'Sale.count' do
      post sales_path, params: { sale: { carModel: "", salesDate:"01/12/2014", fuelType: "Petrol", salesperson_id: @salesPerson.id } }
    end
    assert_match 'You got an error', response.body
    assert_select  'h2'
  end
 
end