# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'dotenv'

User.destroy_all
Destination.destroy_all

user1 = User.create(name: 'Jacob', phone: '5707161763', username: 'kennja05', email: 'jacobkenny05@gmail.com', password: '123', image: 'https://humanorigins.si.edu/sites/default/files/styles/full_width/public/images/square/neanderthalensis_JG_Recon_Head_CC_3qtr_lt_sq.jpg?itok=65pnoWxu')

API_KEY = ENV['exchangeRateApiKey']

currencies= JSON.parse(RestClient.get("http://data.fixer.io/api/latest?access_key=#{API_KEY}"))
currencies.each do |currency|
    byebug
end 


#Creating destination to match with currency codes. I have selected the most-relevant currecies for destinations with multiple options 
countries = JSON.parse(RestClient.get('https://restcountries.eu/rest/v2/all'))
countries.each do |country| 
    if country['name'] === "Antarctica" || country['name'] === "Virgin Islands (British)" || country['name'] === "Micronesia (Federated States of)" || country['name'] === "Palau" || country['name'] === "Singapore"
        Destination.create(name: country['name'], code: country['currencies'][1]['code'], symbol: country['currencies'][1]['symbol'])
    elsif country['name'] === "Zimbabwe"
        Destination.create(name: country['name'], code: country['currencies'][7]['code'], symbol: country['currencies'][7]['symbol'])
    else
        Destination.create(name: country['name'], code: country['currencies'][0]['code'], symbol: country['currencies'][0]['symbol'])    
    end
end 

