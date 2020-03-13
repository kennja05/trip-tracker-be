class AddCapitalToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :capital, :string
  end
end
