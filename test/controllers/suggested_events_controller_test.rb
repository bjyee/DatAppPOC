require 'test_helper'

class SuggestedEventsControllerTest < ActionController::TestCase
  setup do
    @suggested_event = suggested_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suggested_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create suggested_event" do
    assert_difference('SuggestedEvent.count') do
      post :create, suggested_event: { category_id: @suggested_event.category_id, datetime_created: @suggested_event.datetime_created, location_id: @suggested_event.location_id, what: @suggested_event.what, when: @suggested_event.when }
    end

    assert_redirected_to suggested_event_path(assigns(:suggested_event))
  end

  test "should show suggested_event" do
    get :show, id: @suggested_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @suggested_event
    assert_response :success
  end

  test "should update suggested_event" do
    patch :update, id: @suggested_event, suggested_event: { category_id: @suggested_event.category_id, datetime_created: @suggested_event.datetime_created, location_id: @suggested_event.location_id, what: @suggested_event.what, when: @suggested_event.when }
    assert_redirected_to suggested_event_path(assigns(:suggested_event))
  end

  test "should destroy suggested_event" do
    assert_difference('SuggestedEvent.count', -1) do
      delete :destroy, id: @suggested_event
    end

    assert_redirected_to suggested_events_path
  end
end
