require 'test_helper'

class MovieManagersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
