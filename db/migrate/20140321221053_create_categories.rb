class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_title
      t.string :category_slug
      t.timestamps
    end
  end
end
