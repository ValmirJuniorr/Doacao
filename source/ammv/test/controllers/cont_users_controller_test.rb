require 'test_helper'

class ContUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cont_users_index_url
    assert_response :success
  end

end
