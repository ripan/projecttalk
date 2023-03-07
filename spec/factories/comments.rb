FactoryBot.define do
  factory :comment do
    body{ FFaker::Lorem.paragraph }
    project
    parent_id{ nil }
  end
end
