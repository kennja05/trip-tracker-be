class AddCurrencyNameToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :currency_name, :string
  end
end

