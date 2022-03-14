require "test_helper"

class PartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parts_index_url
    assert_response :success
  end

  test "should get edit" do
    get parts_edit_url
    assert_response :success
  end
end
