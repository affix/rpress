class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string	:author_id
      t.string	:ip_addr
      t.timestamps
    end
  end
end
