require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [create(:project, title: "TitleOne", body: "MyTextOne"), create(:project, title: "TitleTwo", body: "MyTextTwo")])
  end

  it "renders a list of projects" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("TitleOne".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("TitleTwo".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("MyTextOne".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("draft".to_s), count: 2
  end
end
