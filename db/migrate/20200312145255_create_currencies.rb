class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :code
      t.integer :value
      t.integer :destination_id
      t.timestamps
    end
  end
end
