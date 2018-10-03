require 'test_helper'

class WechatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wechat = wechats(:one)
  end

  test "should get index" do
    get wechats_url, as: :json
    assert_response :success
  end

  test "should create wechat" do
    assert_difference('Wechat.count') do
      post wechats_url, params: { wechat: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show wechat" do
    get wechat_url(@wechat), as: :json
    assert_response :success
  end

  test "should update wechat" do
    patch wechat_url(@wechat), params: { wechat: {  } }, as: :json
    assert_response 200
  end

  test "should destroy wechat" do
    assert_difference('Wechat.count', -1) do
      delete wechat_url(@wechat), as: :json
    end

    assert_response 204
  end
end
