class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :group_id, index: true
      t.string :what
      t.string :when
      t.string :why
      t.string :where
      t.references :who_created, index: true
      t.datetime :datetime_created
      t.references :who_updated, index: true
      t.datetime :datetime_updated

      t.timestamps
    end
  end
end
