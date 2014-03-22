class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_title
      t.string :post_slug
      t.text   :post_body
      t.integer :category_id
      t.belongs_to :author
      t.timestamps
    end
  end
end