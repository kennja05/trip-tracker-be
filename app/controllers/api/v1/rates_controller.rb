class Api::V1::RatesController < ApplicationController


    def index
        rates = Rate.all 
        render json: rates
    end 

    def show
        rate = Rate.find(params['id'])
        render json: rate
    end


end
