class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string  :tag_name
      t.string  :tag_slug
      t.integer :post_id
      t.timestamps
    end
  end
end
