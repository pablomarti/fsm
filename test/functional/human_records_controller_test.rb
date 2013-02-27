require 'test_helper'

class HumanRecordsControllerTest < ActionController::TestCase
  test "should get victim_stabilized" do
    get :victim_stabilized
    assert_response :success
  end

  test "should get active_listening" do
    get :active_listening
    assert_response :success
  end

  test "should get heal_injuries" do
    get :heal_injuries
    assert_response :success
  end

  test "should get demand" do
    get :demand
    assert_response :success
  end

end
