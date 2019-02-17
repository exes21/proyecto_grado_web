require 'test_helper'

class PermisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permise = permises(:one)
  end

  test "should get index" do
    get permises_url
    assert_response :success
  end

  test "should get new" do
    get new_permise_url
    assert_response :success
  end

  test "should create permise" do
    assert_difference('Permise.count') do
      post permises_url, params: { permise: { method: @permise.method, object: @permise.object } }
    end

    assert_redirected_to permise_url(Permise.last)
  end

  test "should show permise" do
    get permise_url(@permise)
    assert_response :success
  end

  test "should get edit" do
    get edit_permise_url(@permise)
    assert_response :success
  end

  test "should update permise" do
    patch permise_url(@permise), params: { permise: { method: @permise.method, object: @permise.object } }
    assert_redirected_to permise_url(@permise)
  end

  test "should destroy permise" do
    assert_difference('Permise.count', -1) do
      delete permise_url(@permise)
    end

    assert_redirected_to permises_url
  end
end
