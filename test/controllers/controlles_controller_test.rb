require 'test_helper'

class ControllesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @controlle = controlles(:one)
  end

  test "should get index" do
    get controlles_url
    assert_response :success
  end

  test "should get new" do
    get new_controlle_url
    assert_response :success
  end

  test "should create controlle" do
    assert_difference('Controlle.count') do
      post controlles_url, params: { controlle: { departments_subdepartments_brands: @controlle.departments_subdepartments_brands } }
    end

    assert_redirected_to controlle_url(Controlle.last)
  end

  test "should show controlle" do
    get controlle_url(@controlle)
    assert_response :success
  end

  test "should get edit" do
    get edit_controlle_url(@controlle)
    assert_response :success
  end

  test "should update controlle" do
    patch controlle_url(@controlle), params: { controlle: { departments_subdepartments_brands: @controlle.departments_subdepartments_brands } }
    assert_redirected_to controlle_url(@controlle)
  end

  test "should destroy controlle" do
    assert_difference('Controlle.count', -1) do
      delete controlle_url(@controlle)
    end

    assert_redirected_to controlles_url
  end
end
