class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link
      t.datetime :published
      t.text :description
      t.text :content
      t.text :categories
      t.string :author
      t.text :item
      t.timestamps
    end
  end
end
