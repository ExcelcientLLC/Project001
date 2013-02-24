require 'spec_helper'

describe "goal_states/index" do
  before(:each) do
    assign(:goal_states, [
      stub_model(GoalState,
        :current_value => 1,
        :current_expenditures => 2
      ),
      stub_model(GoalState,
        :current_value => 1,
        :current_expenditures => 2
      )
    ])
  end

  it "renders a list of goal_states" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
