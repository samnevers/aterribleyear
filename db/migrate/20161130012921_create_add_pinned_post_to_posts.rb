class CreateAddPinnedPostToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :pinnedpost, :boolean
  end
end
