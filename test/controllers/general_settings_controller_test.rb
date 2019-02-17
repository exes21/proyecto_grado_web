require 'test_helper'

class GeneralSettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get general_settings_form_url
    assert_response :success
  end

  test "should get save" do
    get general_settings_save_url
    assert_response :success
  end

end
