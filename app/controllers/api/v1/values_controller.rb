class Api::V1::ValuesController < ApplicationController

    def index
        values = Value.all 
        render json: values 
    end 

    def todaysValues
        values = Value.all.filter do |value| 
            value.date === Date.today
        end
        render json: values 
    end 

    def show
        value = Value.find(params['id'])
        render json: value
    end

end
