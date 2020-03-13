class Api::V1::ValuesController < ApplicationController

    def index
        values = Value.all 
        render json: values 
    end 

    def show
        value = Value.find_by(params['id'])
        render json: value
    end

end
