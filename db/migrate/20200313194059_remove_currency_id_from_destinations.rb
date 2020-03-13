class RemoveCurrencyIdFromDestinations < ActiveRecord::Migration[6.0]
  def change
    remove_column :destinations, :currency_id
  end
end
