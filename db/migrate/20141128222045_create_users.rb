class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.String :username
      t.String :password
      t.String :firstname
      t.String :lastname
      t.boolean :is_admin
      t.boolean :is_editor
      t.boolean :is_viewer

      t.timestamps
    end
  end
end
