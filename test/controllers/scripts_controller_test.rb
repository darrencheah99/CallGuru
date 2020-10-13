require 'test_helper'

class ScriptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @script = scripts(:one)
  end

  test "should get index" do
    get scripts_url
    assert_response :success
  end

  test "should get new" do
    get new_script_url
    assert_response :success
  end

  test "should create script" do
    assert_difference('Script.count') do
      post scripts_url, params: { script: { content: @script.content, section_id: @script.section_id, title: @script.title, type: @script.type } }
    end

    assert_redirected_to script_url(Script.last)
  end

  test "should show script" do
    get script_url(@script)
    assert_response :success
  end

  test "should get edit" do
    get edit_script_url(@script)
    assert_response :success
  end

  test "should update script" do
    patch script_url(@script), params: { script: { content: @script.content, section_id: @script.section_id, title: @script.title, type: @script.type } }
    assert_redirected_to script_url(@script)
  end

  test "should destroy script" do
    assert_difference('Script.count', -1) do
      delete script_url(@script)
    end

    assert_redirected_to scripts_url
  end
end
