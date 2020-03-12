class AddSymbolColumnToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :symbol, :string
  end
end
