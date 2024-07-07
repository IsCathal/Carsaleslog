require "test_helper"

class SalespeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salesPerson = Salesperson.create(firstName: "Charlie", lastName:"McCabe", salesNumber: 0)
  end


  test "should create salesperson" do
    salesPerson = Salesperson.new(firstName: "Tom", lastName:"McCabe", salesNumber: 0)
    salesPerson.save
    assert_difference("Salesperson.count", 1) do
      post salespeople_url, params: { salesperson: { firstName: "Charlie", lastName:"McCabe", salesNumber: 0 } }
    end
  end

  test "should get new" do
    get new_salesperson_url
    assert_response :success
  end

  test "should redirect to index after successful salesperson creation" do
    post salespeople_url, params: { salesperson: { firstName: "Charlie", lastName:"McCabe", salesNumber: 0  } }
    assert_redirected_to root_path
  end

  test "should set flash notice if sale creation fails" do
    post salespeople_url, params: { salesperson: { firstName: "", lastName:"McCabe", salesNumber: 0  } }
    assert_equal "There was an error", flash[:notice]
  end

end