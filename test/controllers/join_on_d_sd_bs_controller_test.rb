require 'test_helper'

class JoinOnDSdBsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @join_on_d_sd_b = join_on_d_sd_bs(:one)
  end

  test "should get index" do
    get join_on_d_sd_bs_url
    assert_response :success
  end

  test "should get new" do
    get new_join_on_d_sd_b_url
    assert_response :success
  end

  test "should create join_on_d_sd_b" do
    assert_difference('JoinOnDSdB.count') do
      post join_on_d_sd_bs_url, params: { join_on_d_sd_b: {  } }
    end

    assert_redirected_to join_on_d_sd_b_url(JoinOnDSdB.last)
  end

  test "should show join_on_d_sd_b" do
    get join_on_d_sd_b_url(@join_on_d_sd_b)
    assert_response :success
  end

  test "should get edit" do
    get edit_join_on_d_sd_b_url(@join_on_d_sd_b)
    assert_response :success
  end

  test "should update join_on_d_sd_b" do
    patch join_on_d_sd_b_url(@join_on_d_sd_b), params: { join_on_d_sd_b: {  } }
    assert_redirected_to join_on_d_sd_b_url(@join_on_d_sd_b)
  end

  test "should destroy join_on_d_sd_b" do
    assert_difference('JoinOnDSdB.count', -1) do
      delete join_on_d_sd_b_url(@join_on_d_sd_b)
    end

    assert_redirected_to join_on_d_sd_bs_url
  end
end
