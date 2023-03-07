require "rails_helper"

RSpec.describe Comment, type: :model do
  it{ is_expected.to validate_presence_of(:body) }
  it{ is_expected.to have_many(:replies).class_name("Comment").with_foreign_key("parent_id").dependent(:destroy) }
  it{ is_expected.to belong_to(:parent).class_name("Comment").optional }
  it{ is_expected.to belong_to(:project) }
end
