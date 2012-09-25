require 'test_helper'

class GoalsControllerTest < ActionController::TestCase
  setup do
    @goal = goals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal" do
    assert_difference('Goal.count') do
      post :create, goal: { complete: @goal.complete, current_expenditures: @goal.current_expenditures, current_value: @goal.current_value, target_date: @goal.target_date, target_expenditures: @goal.target_expenditures, target_value: @goal.target_value }
    end

    assert_redirected_to goal_path(assigns(:goal))
  end

  test "should show goal" do
    get :show, id: @goal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal
    assert_response :success
  end

  test "should update goal" do
    put :update, id: @goal, goal: { complete: @goal.complete, current_expenditures: @goal.current_expenditures, current_value: @goal.current_value, target_date: @goal.target_date, target_expenditures: @goal.target_expenditures, target_value: @goal.target_value }
    assert_redirected_to goal_path(assigns(:goal))
  end

  test "should destroy goal" do
    assert_difference('Goal.count', -1) do
      delete :destroy, id: @goal
    end

    assert_redirected_to goals_path
  end
end
