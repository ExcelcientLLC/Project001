require 'spec_helper'

describe "disclaimers/edit" do
  before(:each) do
    @disclaimer = assign(:disclaimer, stub_model(Disclaimer,
      :name => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit disclaimer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", disclaimer_path(@disclaimer), "post" do
      assert_select "input#disclaimer_name[name=?]", "disclaimer[name]"
      assert_select "textarea#disclaimer_body[name=?]", "disclaimer[body]"
    end
  end
end
