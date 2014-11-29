class CreateSuggestedEvents < ActiveRecord::Migration
  def change
    create_table :suggested_events do |t|
      t.references :location, index: true
      t.references :category, index: true
      t.string :what
      t.string :when
      t.datetime :datetime_created

      t.timestamps
    end
  end
end
