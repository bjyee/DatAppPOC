class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :group_id
      t.String :name

      t.timestamps
    end
  end
end
