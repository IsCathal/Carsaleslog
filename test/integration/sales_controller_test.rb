require "test_helper"

class SalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salesPerson = Salesperson.create(firstName: "Charlie", lastName:"McCabe", salesNumber: 0)
    @sale = Sale.new(carModel: "Opel", salesDate:"01/12/2014", fuelType: "Petrol", salesperson_id: @salesPerson.id)
  end

  test "should get index" do
    get sales_url
    assert_response :success
  end

  test "should create sale" do
    @salesPerson.save
    assert_difference("Sale.count", 1) do
      post sales_url, params: { sale: { carModel: "Ferrari", salesDate:"01/12/2014", fuelType: "Petrol", salesperson_id:  @salesPerson.id } }
    end
  end

  test "should get new" do
    get new_sale_url
    assert_response :success
  end

  test "should redirect to root path after successful item creation" do
    post sales_url, params: { sale: { carModel: "Ferrari", salesDate:"01/12/2014", fuelType: "Petrol", salesperson_id:  @salesPerson.id } }
    assert_redirected_to root_path
  end

  test "should set flash notice if item creation fails" do
    post sales_url, params: { sale: { carModel: "", salesDate:"01/12/2014", fuelType: "Petrol", salesperson_id:  @salesPerson.id } }
    assert_equal "There was an error", flash[:notice]
  end

end