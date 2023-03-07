class AddMissingUniqueIndexOnProjects < ActiveRecord::Migration[7.0]
  def change
    add_index :projects, :title, unique: true
  end
end
