require 'test_helper'

class InfoPagesControllerTest < ActionController::TestCase
  setup do
    @info_page = info_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:info_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create info_page" do
    assert_difference('InfoPage.count') do
      post :create, info_page: { content: @info_page.content, name: @info_page.name }
    end

    assert_redirected_to info_page_path(assigns(:info_page))
  end

  test "should show info_page" do
    get :show, id: @info_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @info_page
    assert_response :success
  end

  test "should update info_page" do
    put :update, id: @info_page, info_page: { content: @info_page.content, name: @info_page.name }
    assert_redirected_to info_page_path(assigns(:info_page))
  end

  test "should destroy info_page" do
    assert_difference('InfoPage.count', -1) do
      delete :destroy, id: @info_page
    end

    assert_redirected_to info_pages_path
  end
end
