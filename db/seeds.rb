require 'rest-client'
require 'byebug'
Destination.destroy_all
rateKey = ENV["exchangeRateApiKey"]
# Creating destination to match with currency codes. I selected the most-relevant currecies for destinations with multiple options 
destinations = JSON.parse(RestClient.get("https://restcountries.com/v3.1/all"))
destinations = destinations.select {|country| country["currencies"]}
availableRates = JSON.parse(RestClient.get("http://data.fixer.io/api/latest?access_key=#{rateKey}&base=usd"))
destinations.each do |country|
    byebug
    if country["name"]["common"] != "South Sudan" #The ER tracker does not have the South Sudan Pound Available, and the Countries API lists no alternate Currencies
        if country['name']["common"] === "Antarctica" || country['name']["common"] === "Virgin Islands (British)" || country['name']["common"] === "Micronesia (Federated States of)" || country['name']["common"] === "Palau" || country['name']["common"] === "Singapore"
            Destination.create(image: country['flag'], name: country['name']["common"], native_name: country['nativeName'], capital: country['capital'][0], code: country['currencies'][1]['code'], symbol: country['currencies'][1]['symbol'], currency_name: country['currencies'][1]['name'])
        elsif country['name']["common"] === "Zimbabwe"
            Destination.create(image: country['flag'], name: country['name']["common"], native_name: country['nativeName'], capital: country['capital'][0], code: country['currencies'][7]['code'], symbol: country['currencies'][7]['symbol'], currency_name: country['currencies'][7]['name'])
        else
            Destination.create(image: country['flag'], name: country['name']["common"], native_name: country['nativeName'], capital: country['capital'][0], code: country['currencies'][0]['code'], symbol: country['currencies'][0]['symbol'], currency_name: country['currencies'][0]['name'])    
        end
    end 
end