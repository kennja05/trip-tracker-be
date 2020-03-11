class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.integer :user_id
      t.integer :destination_id
      t.timestamps
    end
  end
end
