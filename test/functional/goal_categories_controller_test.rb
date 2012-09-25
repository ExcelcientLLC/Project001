require 'test_helper'

class GoalCategoriesControllerTest < ActionController::TestCase
  setup do
    @goal_category = goal_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goal_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal_category" do
    assert_difference('GoalCategory.count') do
      post :create, goal_category: { icon: @goal_category.icon, name: @goal_category.name, priority: @goal_category.priority }
    end

    assert_redirected_to goal_category_path(assigns(:goal_category))
  end

  test "should show goal_category" do
    get :show, id: @goal_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal_category
    assert_response :success
  end

  test "should update goal_category" do
    put :update, id: @goal_category, goal_category: { icon: @goal_category.icon, name: @goal_category.name, priority: @goal_category.priority }
    assert_redirected_to goal_category_path(assigns(:goal_category))
  end

  test "should destroy goal_category" do
    assert_difference('GoalCategory.count', -1) do
      delete :destroy, id: @goal_category
    end

    assert_redirected_to goal_categories_path
  end
end
