class Api::V1::PlannedExpensesController < ApplicationController

    def index
        plannedExpenses = PlannedExpense.all 
        render json: plannedExpenses
    end 

    def show
        plannedExpense = PlannedExpense.find(params['id'])
        render json: plannedExpense 
    end 


end
