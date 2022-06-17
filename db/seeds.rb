require 'rest-client'

# Destination.destroy_all
key = ENV['countryApiKey']
# Creating destination to match with currency codes. I have selected the most-relevant currecies for destinations with multiple options 
destinations = JSON.parse(RestClient.get("https://restcountries.eu/rest/v2/all?access_key=#{key}"))
destinations.each do |country|
    if country['name'] != "South Sudan" #The ER tracker does not have the South Sudan Pound Available, and the Countries API lists no alternate Currencies
        if country['name'] === "Antarctica" || country['name'] === "Virgin Islands (British)" || country['name'] === "Micronesia (Federated States of)" || country['name'] === "Palau" || country['name'] === "Singapore"
            Destination.create(image: country['flag'], name: country['name'], native_name: country['nativeName'], capital: country['capital'], code: country['currencies'][1]['code'], symbol: country['currencies'][1]['symbol'], currency_name: country['currencies'][1]['name'])
        elsif country['name'] === "Zimbabwe"
            Destination.create(image: country['flag'], name: country['name'], native_name: country['nativeName'], capital: country['capital'], code: country['currencies'][7]['code'], symbol: country['currencies'][7]['symbol'], currency_name: country['currencies'][7]['name'])
        else
            Destination.create(image: country['flag'], name: country['name'], native_name: country['nativeName'], capital: country['capital'], code: country['currencies'][0]['code'], symbol: country['currencies'][0]['symbol'], currency_name: country['currencies'][0]['name'])    
        end
    end 
end