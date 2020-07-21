class Api::V1::RatesController < ApplicationController


    def index
        rates = Rate.all 
        render json: rates
    end 

    def show
        rate = Rate.find(params['id'])
        render json: rate
    end

    def mostRecent #this will get the two most recent rate objects
        rates = Rate.all.last(2)
        render json: rates
    end

    def ratesAtCreation #this will look to get the rates at the time in which the trip was created
        formattedDate = params['date'].split('-').join('').to_i
        rates = Rate.all.filter do |rate|
            rate.rate_list['date'].split('-').join('').to_i >= formattedDate 
        end
        byebug
        render json: rates 
    end

end
