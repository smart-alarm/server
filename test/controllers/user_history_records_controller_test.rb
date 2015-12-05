require 'test_helper'

class UserHistoryRecordsControllerTest < ActionController::TestCase
  setup do
    @user_history_record = user_history_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_history_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_history_record" do
    assert_difference('UserHistoryRecord.count') do
      post :create, user_history_record: {  }
    end

    assert_redirected_to user_history_record_path(assigns(:user_history_record))
  end

  test "should show user_history_record" do
    get :show, id: @user_history_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_history_record
    assert_response :success
  end

  test "should update user_history_record" do
    patch :update, id: @user_history_record, user_history_record: {  }
    assert_redirected_to user_history_record_path(assigns(:user_history_record))
  end

  test "should destroy user_history_record" do
    assert_difference('UserHistoryRecord.count', -1) do
      delete :destroy, id: @user_history_record
    end

    assert_redirected_to user_history_records_path
  end
end
