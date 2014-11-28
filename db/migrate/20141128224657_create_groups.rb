class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.String :name
      t.String :image
      t.datetime :datetime_create
      t.datetime :datetime_updated
      t.integer :who_created
      t.integer :who_updated
      t.integer :based_in

      t.timestamps
    end
  end
end
