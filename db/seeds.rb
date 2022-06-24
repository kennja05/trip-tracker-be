require 'rest-client'
require 'byebug'
Destination.destroy_all
rateKey = ENV["exchangeRateApiKey"]
# Creating destination to match with currency codes. I selected the most-relevant currecies for destinations with multiple options 
destinations = JSON.parse(RestClient.get("https://restcountries.com/v3.1/all"))
destinations = destinations.select {|country| country["currencies"]}
availableRates = JSON.parse(RestClient.get("http://data.fixer.io/api/latest?access_key=#{rateKey}&base=usd"))

#countries that have multiple currencies to choose from - 19
#countries that are not choosing the first one available
#Cook Islands - 1
#Palestine - 1
#Saint Helena, Asencion and Tristan da Cunha - 1
#Cuba - 1
#Jersey - 1
#Isle of Man - 1
#Guernsey - 1
 
#Macau does not have a capital
#dont have available currency
#South Sudan, Sao Tome and Principe, Mauritania - will just assign USD
destinations.each do |country|
    byebug
    if country["name"]["common"] != "South Sudan" #The ER tracker does not have the South Sudan Pound Available, and the Countries API lists no alternate Currencies 
        Destination.create(
        image: country['flag'],
        name: country['name']["common"], 
        native_name: country["name"]['nativeName'][country["name"]["nativeName"].keys[0]]["common"], 
        capital: country["capital"] ? country['capital'][0] : "No Capital City", 
        code: country["currencies"].keys[0], 
        symbol: country["currencies"][country["currencies"].keys[0]]["symbol"], 
        currency_name: country["currencies"][country["currencies"].keys[0]]["name"]
        )    
    end 
end

