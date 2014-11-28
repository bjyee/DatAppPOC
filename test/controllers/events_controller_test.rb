require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { datetime_created: @event.datetime_created, datetime_updated: @event.datetime_updated, group_id: @event.group_id, what: @event.what, when: @event.when, where: @event.where, who_created: @event.who_created, who_updated: @event.who_updated, why: @event.why }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { datetime_created: @event.datetime_created, datetime_updated: @event.datetime_updated, group_id: @event.group_id, what: @event.what, when: @event.when, where: @event.where, who_created: @event.who_created, who_updated: @event.who_updated, why: @event.why }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
