class AddNativeNameToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :native_name, :string
  end
end
