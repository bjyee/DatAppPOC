class CreateSuggestedEvents < ActiveRecord::Migration
  def change
    create_table :suggested_events do |t|
      t.integer :location_id
      t.integer :category_id
      t.string :what
      t.string :when
      t.datetime :datetime_created

      t.timestamps
    end
  end
end
