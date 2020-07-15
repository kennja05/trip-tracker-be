desc "This task is called by the Heroku scheduler add-on"
task :get_rates => :environment do
  puts "Getting newest rates..."
  RateGetter.obtainNewestRates
  puts "done."
end

desc 'This is the updated rate getter task'
task :fetch_rates => :environment do
  puts 'Getting those rates you asked for'
  Rate.getRates
  puts 'finished'
end