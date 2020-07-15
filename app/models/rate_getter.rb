# require 'dotenv'
require 'rest-client'

class RateGetter < ApplicationRecord

    @@API_KEY = ENV['exchangeRateApiKey']

    def self.obtainNewestRates 
        key = ENV['exchangeRateApiKey']
        rates = JSON.parse(RestClient.get("http://data.fixer.io/api/latest?access_key=#{key}&base=usd"))
        i = 0
        while i < rates['rates'].length
            Value.create(date: rates['date'], code: rates['rates'].keys[i], rate: rates['rates'].values[i].round(3)) 
        i += 1
        end
        Destination.all.each do |destination| 
            matchingValue = Value.where(code: destination.code).last
            myCurrency = Currency.create(destination_id: destination.id, value_id: matchingValue.id) 
        end
    end 

end 