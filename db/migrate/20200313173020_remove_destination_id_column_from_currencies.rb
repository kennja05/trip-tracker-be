class RemoveDestinationIdColumnFromCurrencies < ActiveRecord::Migration[6.0]
  def change
    remove_column :currencies, :destination_id
  end
end
