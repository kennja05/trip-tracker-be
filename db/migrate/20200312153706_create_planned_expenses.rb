class CreatePlannedExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :planned_expenses do |t|
      t.integer :cost
      t.string :category
      t.string :name
      t.date :date
      t.timestamps
    end
  end
end
