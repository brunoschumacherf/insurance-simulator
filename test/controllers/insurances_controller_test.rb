require "test_helper"

class InsurancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insurance = insurances(:one)
  end

  test "should get index" do
    get insurances_url, as: :json
    assert_response :success
  end

  test "should create insurance" do
    assert_difference("Insurance.count") do
      post insurances_url, params: { insurance: { name: @insurance.name } }, as: :json
    end

    assert_response :created
  end

  test "should show insurance" do
    get insurance_url(@insurance), as: :json
    assert_response :success
  end

  test "should update insurance" do
    patch insurance_url(@insurance), params: { insurance: { name: @insurance.name } }, as: :json
    assert_response :success
  end

  test "should destroy insurance" do
    assert_difference("Insurance.count", -1) do
      delete insurance_url(@insurance), as: :json
    end

    assert_response :no_content
  end
end
