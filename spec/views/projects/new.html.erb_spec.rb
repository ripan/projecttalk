require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, build(:project, title: "MyString", body: "MyText", status: "draft"))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input[name=?]", "project[title]"

      assert_select "textarea[name=?]", "project[body]"

      assert_select "select[name=?]", "project[status]"
    end
  end
end
