class Api::V1::RatesController < ApplicationController


    def index
        rates = Rate.all 
        render json: rates
    end 

    def show
        rate = Rate.find(params['id'])
        render json: rate
    end

    def mostRecent #this will get the two most recent rate objects to see if the most recent exhange rate is up or down
        rates = Rate.all.last(2)
        render json: rates
    end

    def ratesAtCreation #this will look to get the rates at the time in which the trip was created
        formattedDate = params['date'].split('-').join('').to_i
        rates = Rate.all.filter do |rate| ##get all the rates that have the right date
            rate.rate_list['date'].split('-').join('').to_i >= formattedDate 
        end
        res = []
        rates.each do |rate|
            myObj = { #obtain only the necessary information from those ratesc
                rate: rate.rate_list['rates'][params['code']],
                date: rate.created_at
            }
            
            res << myObj
        end
        
        render json: res 
    end

end
