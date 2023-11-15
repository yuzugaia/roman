class AddNovelIdToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookmarks, :novel, null: false, foreign_key: true
  end
end
