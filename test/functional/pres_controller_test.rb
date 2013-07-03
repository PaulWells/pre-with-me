require 'test_helper'

class PresControllerTest < ActionController::TestCase
  setup do
    @pre = pres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pre" do
    assert_difference('Pre.count') do
      post :create, pre: { date: @pre.date, description: @pre.description, facebook_event_id: @pre.facebook_event_id, latitude: @pre.latitude, longitude: @pre.longitude, name: @pre.name }
    end

    assert_redirected_to pre_path(assigns(:pre))
  end

  test "should show pre" do
    get :show, id: @pre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pre
    assert_response :success
  end

  test "should update pre" do
    put :update, id: @pre, pre: { date: @pre.date, description: @pre.description, facebook_event_id: @pre.facebook_event_id, latitude: @pre.latitude, longitude: @pre.longitude, name: @pre.name }
    assert_redirected_to pre_path(assigns(:pre))
  end

  test "should destroy pre" do
    assert_difference('Pre.count', -1) do
      delete :destroy, id: @pre
    end

    assert_redirected_to pres_path
  end
end
