class Rate < ApplicationRecord
    
    def self.getRates
        key = ENV['exchangeRateApiKey']
        rates = JSON.parse(RestClient.get("http://data.fixer.io/api/latest?access_key=#{key}&base=usd"))
        Rate.create(rate_list: rates)
    end
    
end
