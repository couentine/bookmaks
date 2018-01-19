class AddBookmarkId < ActiveRecord::Migration[5.1]
    add_column :bookmarks, :bookmark_id, :integer
  def change
  end
end
