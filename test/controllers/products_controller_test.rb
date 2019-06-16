require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get products_new_url
    assert_response :success
  end
  test "cannot delete the product" do
    assert_difference('Product.count',0)
    delete product_url(products(:two))
  end
#  test "should delete the product" do
#    assert_difference('Product.count',-1)
#    delete product_url(@product)
#  end
  
  
  

end
