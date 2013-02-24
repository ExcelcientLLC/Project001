require 'spec_helper'

describe "goal_states/new" do
  before(:each) do
    assign(:goal_state, stub_model(GoalState,
      :current_value => 1,
      :current_expenditures => 1
    ).as_new_record)
  end

  it "renders new goal_state form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", goal_states_path, "post" do
      assert_select "input#goal_state_current_value[name=?]", "goal_state[current_value]"
      assert_select "input#goal_state_current_expenditures[name=?]", "goal_state[current_expenditures]"
    end
  end
end
