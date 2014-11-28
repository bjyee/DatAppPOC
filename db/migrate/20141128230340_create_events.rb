class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :group_id
      t.String :what
      t.String :when
      t.String :why
      t.String :where
      t.integer :who_created
      t.datetime :datetime_created
      t.integer :who_updated
      t.datetime :datetime_updated

      t.timestamps
    end
  end
end
