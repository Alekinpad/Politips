require 'test_helper'

class SitiosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sitios_index_url
    assert_response :success
  end

  test "should get resultado" do
    get sitios_resultado_url
    assert_response :success
  end

  test "should get contacto" do
    get sitios_contacto_url
    assert_response :success
  end

end
