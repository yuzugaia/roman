class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      
      t.references :user, null: false
      t.references :novel, null: false

      t.timestamps
    end
  end
end
