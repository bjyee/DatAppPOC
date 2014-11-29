class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :longitude
      t.float :latitude
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
