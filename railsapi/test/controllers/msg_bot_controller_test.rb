require 'test_helper'

class MsgBotControllerTest < ActionDispatch::IntegrationTest
  test "should get receiveMsg" do
    get msg_bot_receiveMsg_url
    assert_response :success
  end

end
