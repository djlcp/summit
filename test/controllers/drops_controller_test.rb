require 'test_helper'

class DropsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drop = drops(:one)
  end

  test "should get index" do
    get drops_url
    assert_response :success
  end

  test "should get new" do
    get new_drop_url
    assert_response :success
  end

  test "should create drop" do
    assert_difference('Drop.count') do
      post drops_url, params: { drop: { description: @drop.description, title: @drop.title } }
    end

    assert_redirected_to drop_url(Drop.last)
  end

  test "should show drop" do
    get drop_url(@drop)
    assert_response :success
  end

  test "should get edit" do
    get edit_drop_url(@drop)
    assert_response :success
  end

  test "should update drop" do
    patch drop_url(@drop), params: { drop: { description: @drop.description, title: @drop.title } }
    assert_redirected_to drop_url(@drop)
  end

  test "should destroy drop" do
    assert_difference('Drop.count', -1) do
      delete drop_url(@drop)
    end

    assert_redirected_to drops_url
  end
end
