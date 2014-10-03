require 'test_helper'

class FileFoldersControllerTest < ActionController::TestCase
  setup do
    @file_folder = file_folders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_folders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_folder" do
    assert_difference('FileFolder.count') do
      post :create, file_folder: {  }
    end

    assert_redirected_to file_folder_path(assigns(:file_folder))
  end

  test "should show file_folder" do
    get :show, id: @file_folder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_folder
    assert_response :success
  end

  test "should update file_folder" do
    patch :update, id: @file_folder, file_folder: {  }
    assert_redirected_to file_folder_path(assigns(:file_folder))
  end

  test "should destroy file_folder" do
    assert_difference('FileFolder.count', -1) do
      delete :destroy, id: @file_folder
    end

    assert_redirected_to file_folders_path
  end
end
