require "test_helper"

class CreateSalesTest < ActionDispatch::IntegrationTest

  setup do
    @salesPerson = Salesperson.create(firstName: "Charlie", lastName:"McCabe", salesNumber: 0)
    
  end

  test "the new salesperson form and create salesperson" do
    get "/salespeople/new"
    assert_response :success
    assert_difference 'Salesperson.count', 1 do
      post salespeople_path, params: { salesperson: { firstName: "Charlie", lastName:"McCabe", salesNumber: 0 } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end

  test "the new salesperson form and reject invalid salesperson submission" do
    get "/salespeople/new"
    assert_response :success
    assert_no_difference 'Salesperson.count' do
      post salespeople_path, params: { salesperson: { firstName: "", lastName:"McCabe", salesNumber: 0 } }
    end
    assert_match 'You got an error', response.body
    assert_select  'h2'
  end
 
end