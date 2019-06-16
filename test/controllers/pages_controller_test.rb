require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_tilte = "Reezay"
  end
  test "should get home" do
    get root_path
    assert_response :success
    assert_select   "title", "#{@base_tilte} | Home"
  end

end
