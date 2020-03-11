class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_destinations do |t|
      t.string :name
      t.string :code
      t.string :image
      t.timestamps
    end
  end
end
