class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :image
      t.text :description
      t.references :who_created, index: true
      t.datetime :datetime_created
      t.references :who_updated, index: true
      t.datetime :datetime_updated
      t.references :based_in, index: true

      t.timestamps
    end
  end
end
