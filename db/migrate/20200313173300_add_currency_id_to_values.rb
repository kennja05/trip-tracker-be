class AddCurrencyIdToValues < ActiveRecord::Migration[6.0]
  def change
    add_column :values, :currency_id, :integer
  end
end
