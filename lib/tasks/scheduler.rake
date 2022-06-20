desc 'This is the updated rate getter task'
task :fetch_rates => :environment do
  puts 'Getting those rates you asked for'
  Rate.getRates
  puts 'finished'
end