class CreateValues < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_values do |t|
      t.integer :rate
      t.timestamps
    end
  end
end
