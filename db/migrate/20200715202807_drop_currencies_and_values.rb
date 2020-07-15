class DropCurrenciesAndValues < ActiveRecord::Migration[6.0]
  def change
    drop_table :values 
    drop_table :currencies 
  end
end
