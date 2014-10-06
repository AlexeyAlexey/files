require 'test_helper'

class DbStructuresControllerTest < ActionController::TestCase
  setup do
    @db_structure = db_structures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:db_structures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create db_structure" do
    assert_difference('DbStructure.count') do
      post :create, db_structure: {  }
    end

    assert_redirected_to db_structure_path(assigns(:db_structure))
  end

  test "should show db_structure" do
    get :show, id: @db_structure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @db_structure
    assert_response :success
  end

  test "should update db_structure" do
    patch :update, id: @db_structure, db_structure: {  }
    assert_redirected_to db_structure_path(assigns(:db_structure))
  end

  test "should destroy db_structure" do
    assert_difference('DbStructure.count', -1) do
      delete :destroy, id: @db_structure
    end

    assert_redirected_to db_structures_path
  end
end
