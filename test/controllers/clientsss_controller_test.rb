require "test_helper"

class ClientsssControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clientsss_index_url
    assert_response :success
  end
end
