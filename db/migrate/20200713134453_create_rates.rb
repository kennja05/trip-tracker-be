class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.text :rate_list
      t.timestamps
    end
  end
end
