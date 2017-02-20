require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get incoming" do
    get messages_incoming_url
    assert_response :success
  end

end
