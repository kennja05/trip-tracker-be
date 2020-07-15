class ChangeRatesTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :rates, :rate_list
    add_column :rates, :rate_list, :json
  end
end
