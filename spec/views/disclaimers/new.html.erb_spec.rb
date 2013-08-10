require 'spec_helper'

describe "disclaimers/new" do
  before(:each) do
    assign(:disclaimer, stub_model(Disclaimer,
      :name => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new disclaimer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", disclaimers_path, "post" do
      assert_select "input#disclaimer_name[name=?]", "disclaimer[name]"
      assert_select "textarea#disclaimer_body[name=?]", "disclaimer[body]"
    end
  end
end
