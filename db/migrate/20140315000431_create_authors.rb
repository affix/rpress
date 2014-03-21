class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.string :password_digest
      t.text :about, :null => true
      t.string :image, :null => true
      t.timestamps
    end
  end
end
