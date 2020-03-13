class AddCurrencyIdColumnToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :currency_id, :integer
  end
end
