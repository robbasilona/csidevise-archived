require 'test_helper'

class EvacCentersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evac_center = evac_centers(:one)
  end

  test "should get index" do
    get evac_centers_url, as: :json
    assert_response :success
  end

  test "should create evac_center" do
    assert_difference('EvacCenter.count') do
      post evac_centers_url, params: { evac_center: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show evac_center" do
    get evac_center_url(@evac_center), as: :json
    assert_response :success
  end

  test "should update evac_center" do
    patch evac_center_url(@evac_center), params: { evac_center: {  } }, as: :json
    assert_response 200
  end

  test "should destroy evac_center" do
    assert_difference('EvacCenter.count', -1) do
      delete evac_center_url(@evac_center), as: :json
    end

    assert_response 204
  end
end
