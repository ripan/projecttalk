class Project < ApplicationRecord
  enum :status, { draft: "draft", published: "published", archived: "archived" }

  validates :title, :body, :status, presence: true
  validates :title, uniqueness: true
  validates :status, inclusion: { in: Project.statuses.keys, message: "%{value} is not a valid status" }
end
