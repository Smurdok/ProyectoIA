require 'test_helper'

class PreguntaControllerTest < ActionController::TestCase
  test "should get envia" do
    get :envia
    assert_response :success
  end

end
