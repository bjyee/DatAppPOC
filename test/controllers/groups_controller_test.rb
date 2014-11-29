require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  setup do
    @group = groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group" do
    assert_difference('Group.count') do
      post :create, group: { based_in_id: @group.based_in_id, datetime_created: @group.datetime_created, datetime_updated: @group.datetime_updated, image: @group.image, name: @group.name, who_created_id: @group.who_created_id, who_updated_id: @group.who_updated_id }
    end

    assert_redirected_to group_path(assigns(:group))
  end

  test "should show group" do
    get :show, id: @group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group
    assert_response :success
  end

  test "should update group" do
    patch :update, id: @group, group: { based_in_id: @group.based_in_id, datetime_created: @group.datetime_created, datetime_updated: @group.datetime_updated, image: @group.image, name: @group.name, who_created_id: @group.who_created_id, who_updated_id: @group.who_updated_id }
    assert_redirected_to group_path(assigns(:group))
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete :destroy, id: @group
    end

    assert_redirected_to groups_path
  end
end
