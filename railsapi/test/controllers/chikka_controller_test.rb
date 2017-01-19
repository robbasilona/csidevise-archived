require 'test_helper'

class ChikkaControllerTest < ActionDispatch::IntegrationTest
  test "should get receive" do
    get chikka_receive_url
    assert_response :success
  end

  test "should get send" do
    get chikka_send_url
    assert_response :success
  end

end
