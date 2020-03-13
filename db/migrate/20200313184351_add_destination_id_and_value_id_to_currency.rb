class AddDestinationIdAndValueIdToCurrency < ActiveRecord::Migration[6.0]
  def change
    add_column :currencies, :destination_id, :integer
    add_column :currencies, :value_id, :integer
    remove_column :currencies, :code
  end
end
