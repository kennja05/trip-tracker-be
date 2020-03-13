class RemoveCurrencyIdFromValues < ActiveRecord::Migration[6.0]
  def change
    remove_column :values, :currency_id
  end
end
