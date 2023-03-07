require "rails_helper"

RSpec.describe Project, type: :model do
  it{ is_expected.to define_enum_for(:status).with_values(draft: "draft", published: "published", archived: "archived").backed_by_column_of_type(:string) }
  it{ is_expected.to validate_presence_of(:title) }
  it{ is_expected.to validate_presence_of(:body) }
  it{ is_expected.to validate_presence_of(:status) }
  pending { is_expected.to validate_inclusion_of(:status).in_array(%w[draft published archived]) }

  describe "#uniqueness" do
    let!(:project){ create :project }

    it{ is_expected.to validate_uniqueness_of(:title) }
  end
end
