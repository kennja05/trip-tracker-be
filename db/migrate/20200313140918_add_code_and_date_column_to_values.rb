class AddCodeAndDateColumnToValues < ActiveRecord::Migration[6.0]
  def change
    add_column :values, :date, :date
    add_column :values, :code, :string
  end
end
