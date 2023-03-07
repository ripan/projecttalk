FactoryBot.define do
  factory :project do
    title{ FFaker::Lorem.sentence }
    body{ FFaker::Lorem.paragraph }
    status{ "draft" }
  end
end
