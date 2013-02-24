require 'spec_helper'

describe "goal_states/show" do
  before(:each) do
    @goal_state = assign(:goal_state, stub_model(GoalState,
      :current_value => 1,
      :current_expenditures => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
