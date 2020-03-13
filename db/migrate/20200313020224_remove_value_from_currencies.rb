class RemoveValueFromCurrencies < ActiveRecord::Migration[6.0]
  def change

    remove_column :currencies, :value, :integer
  end
end
