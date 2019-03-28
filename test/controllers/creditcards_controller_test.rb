require 'test_helper'

class CreditcardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get creditcards_index_url
    assert_response :success
  end

  test "should get edit" do
    get creditcards_edit_url
    assert_response :success
  end

end
