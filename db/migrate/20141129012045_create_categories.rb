class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :group, index: true
      t.string :name

      t.timestamps
    end
  end
end
