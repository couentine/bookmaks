class AddUserIdToStories < ActiveRecord::Migration[5.1]
  add_column :bookmarks, :user_id, :integer
  add_column :topics, :user_id, :integer
  def change
  end
end
