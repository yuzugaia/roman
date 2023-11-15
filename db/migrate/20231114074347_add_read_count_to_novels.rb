class AddReadCountToNovels < ActiveRecord::Migration[6.1]
  def change
    add_column :novels, :read_count, :integer
  end
end
