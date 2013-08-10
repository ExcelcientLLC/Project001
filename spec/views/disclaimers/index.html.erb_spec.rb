require 'spec_helper'

describe "disclaimers/index" do
  before(:each) do
    assign(:disclaimers, [
      stub_model(Disclaimer,
        :name => "Name",
        :body => "MyText"
      ),
      stub_model(Disclaimer,
        :name => "Name",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of disclaimers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
