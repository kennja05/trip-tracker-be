desc "This task is called by the Heroku scheduler add-on"
task :get_rates => :environment do
  puts "Getting newest rates..."
  RateGetter.obtainNewestRates
  puts "done."
end