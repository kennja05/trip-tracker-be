class Api::V1::PlannedExpensesController < ApplicationController

    def index
        plannedExpenses = PlannedExpense.all 
        render json: plannedExpenses
    end 

    def show
        plannedExpense = PlannedExpense.find(params['id'])
        render json: plannedExpense 
    end 

    def create
        plannedExpense = PlannedExpense.new(plannedExpenseParams)
        if plannedExpense.save
            render json: plannedExpense
        else
            byebug
        end
    end 

    private

    def plannedExpenseParams
        params.require(:planned_expense).permit(:date, :cost, :name, :category, :trip_id)
    end 


end
