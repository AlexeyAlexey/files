require 'test_helper'

class FilesRootsControllerTest < ActionController::TestCase
  setup do
    @files_root = files_roots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:files_roots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create files_root" do
    assert_difference('FilesRoot.count') do
      post :create, files_root: {  }
    end

    assert_redirected_to files_root_path(assigns(:files_root))
  end

  test "should show files_root" do
    get :show, id: @files_root
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @files_root
    assert_response :success
  end

  test "should update files_root" do
    patch :update, id: @files_root, files_root: {  }
    assert_redirected_to files_root_path(assigns(:files_root))
  end

  test "should destroy files_root" do
    assert_difference('FilesRoot.count', -1) do
      delete :destroy, id: @files_root
    end

    assert_redirected_to files_roots_path
  end
end
