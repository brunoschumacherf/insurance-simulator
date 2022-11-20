require "test_helper"

class RoofsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @roof = roofs(:one)
  end

  test "should get index" do
    get roofs_url, as: :json
    assert_response :success
  end

  test "should create roof" do
    assert_difference("Roof.count") do
      post roofs_url, params: { roof: { factor: @roof.factor, name: @roof.name } }, as: :json
    end

    assert_response :created
  end

  test "should show roof" do
    get roof_url(@roof), as: :json
    assert_response :success
  end

  test "should update roof" do
    patch roof_url(@roof), params: { roof: { factor: @roof.factor, name: @roof.name } }, as: :json
    assert_response :success
  end

  test "should destroy roof" do
    assert_difference("Roof.count", -1) do
      delete roof_url(@roof), as: :json
    end

    assert_response :no_content
  end
end
