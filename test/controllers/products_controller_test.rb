require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @update = {
      title: 'Lorem ipsum',
      description: 'Wibbles are fun!',
      image_url: 'rails.png',
      price: 19.95
    }
  end

  test "should get index" do
    get products_url
    assert_response :success
    assert_select 'h1', 'Products'
    assert_select '#columns #side a', minimum: 4
    assert_select '#columns #side li', /\d\d\/\d\d\/\d\d\d\d\s-\s\d\d:\d\d:\d\d/
    assert_select 'td a', 'Show'
    assert_select 'td a', 'Destroy'
    assert_select 'td a', 'Edit'
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: @update }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product:  @update }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end

  test "can't delete product in cart" do
    assert_difference('Product.count', 0) do
      delete product_url(products(:two))
    end

    assert_redirected_to products_url
  end
end
