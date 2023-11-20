class CreateNovels < ActiveRecord::Migration[6.1]
  def change
    create_table :novels do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
