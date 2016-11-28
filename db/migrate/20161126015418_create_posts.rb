class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.text :text
      t.text :image
      t.integer :user_id
      t.date :date
      t.text :type

      t.timestamps null: false
    end
  end
end
