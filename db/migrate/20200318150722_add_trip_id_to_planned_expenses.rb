class AddTripIdToPlannedExpenses < ActiveRecord::Migration[6.0]
  def change
    add_column :planned_expenses, :trip_id, :integer
  end
end
