class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.string :password_salt
      t.string :firstname
      t.string :lastname
      t.boolean :is_admin
      t.boolean :is_editor
      t.boolean :is_viewer

      t.timestamps
    end
  end
end
