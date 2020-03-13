class UpdateDataTypeForRateInValues < ActiveRecord::Migration[6.0]
  def change
    change_column :values, :rate, :float
  end
end
