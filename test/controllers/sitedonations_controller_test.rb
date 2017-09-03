require 'test_helper'

class SitedonationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sitedonation = sitedonations(:one)
  end

  test "should get index" do
    get sitedonations_url
    assert_response :success
  end

  test "should get new" do
    get new_sitedonation_url
    assert_response :success
  end

  test "should create sitedonation" do
    assert_difference('Sitedonation.count') do
      post sitedonations_url, params: { sitedonation: { amount: @sitedonation.amount, email: @sitedonation.email, name: @sitedonation.name, tag: @sitedonation.tag } }
    end

    assert_redirected_to sitedonation_url(Sitedonation.last)
  end

  test "should show sitedonation" do
    get sitedonation_url(@sitedonation)
    assert_response :success
  end

  test "should get edit" do
    get edit_sitedonation_url(@sitedonation)
    assert_response :success
  end

  test "should update sitedonation" do
    patch sitedonation_url(@sitedonation), params: { sitedonation: { amount: @sitedonation.amount, email: @sitedonation.email, name: @sitedonation.name, tag: @sitedonation.tag } }
    assert_redirected_to sitedonation_url(@sitedonation)
  end

  test "should destroy sitedonation" do
    assert_difference('Sitedonation.count', -1) do
      delete sitedonation_url(@sitedonation)
    end

    assert_redirected_to sitedonations_url
  end
end
