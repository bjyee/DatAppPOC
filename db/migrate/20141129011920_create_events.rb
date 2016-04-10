class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :group, index: true
      t.string :name
      t.date :startdate
      t.timestamp :starttime
      t.date :enddate
      t.timestamp :endtime
      t.string :description
      t.string :where
      t.references :who_created, index: true
      t.datetime :datetime_created
      t.references :who_updated, index: true
      t.datetime :datetime_updated

      t.timestamps
    end
  end
end
