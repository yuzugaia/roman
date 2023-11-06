class CreateNovelTags < ActiveRecord::Migration[6.1]
  def change
    create_table :novel_tags do |t|

      t.timestamps
    end
  end
end
