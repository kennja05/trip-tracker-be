require 'rest-client'
require 'dotenv'

# Destination.destroy_all

#Creating the initial values for each currency. Ideally this will done on an hourly basis
API_KEY = ENV['exchangeRateApiKey']
rates = JSON.parse(RestClient.get("http://data.fixer.io/api/latest?access_key=#{API_KEY}&base=usd"))
i = 0
while i < rates['rates'].length
    Value.create(date: rates['date'], code: rates['rates'].keys[i], rate: rates['rates'].values[i].round(3)) 
i += 1
end


# Creating destination to match with currency codes. I have selected the most-relevant currecies for destinations with multiple options 
# destinations = JSON.parse(RestClient.get('https://restcountries.eu/rest/v2/all'))
# destinations.each do |country|
#     if country['name'] != "South Sudan" #The ER tracker does not have the South Sudan Pound Available, and the Countries API lists no alternate Currencies
#         if country['name'] === "Antarctica" || country['name'] === "Virgin Islands (British)" || country['name'] === "Micronesia (Federated States of)" || country['name'] === "Palau" || country['name'] === "Singapore"
#             Destination.create(image: country['flag'], name: country['name'], native_name: country['nativeName'], capital: country['capital'], code: country['currencies'][1]['code'], symbol: country['currencies'][1]['symbol'], currency_name: country['currencies'][1]['name'])
#         elsif country['name'] === "Zimbabwe"
#             Destination.create(image: country['flag'], name: country['name'], native_name: country['nativeName'], capital: country['capital'], code: country['currencies'][7]['code'], symbol: country['currencies'][7]['symbol'], currency_name: country['currencies'][7]['name'])
#         else
#             Destination.create(image: country['flag'], name: country['name'], native_name: country['nativeName'], capital: country['capital'], code: country['currencies'][0]['code'], symbol: country['currencies'][0]['symbol'], currency_name: country['currencies'][0]['name'])    
#         end
#     end 
# end 


#Creating Currencies. The purpose of this is to allow for the destination to always have access to the most recent ER
Destination.all.each do |destination| 
    matchingValue = Value.where(code: destination.code).last
    myCurrency = Currency.create(destination_id: destination.id, value_id: matchingValue.id) 
end