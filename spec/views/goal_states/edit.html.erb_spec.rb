require 'spec_helper'

describe "goal_states/edit" do
  before(:each) do
    @goal_state = assign(:goal_state, stub_model(GoalState,
      :current_value => 1,
      :current_expenditures => 1
    ))
  end

  it "renders the edit goal_state form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", goal_state_path(@goal_state), "post" do
      assert_select "input#goal_state_current_value[name=?]", "goal_state[current_value]"
      assert_select "input#goal_state_current_expenditures[name=?]", "goal_state[current_expenditures]"
    end
  end
end
