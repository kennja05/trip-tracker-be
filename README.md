*Languages Used

Javascript, React, HTML, CSS

*Background

When planning a trip a lot of people like to make a budget for their expenses. Someone like myself could budget $500 for food and $1000 for the hotel stay, or a better planner than I might want to build out a table with various types of expenses detailing exactly how much will be spent for each expense. I would say that either way is fine, but something that many would not consider during the planning process of a trip to the foreign country, is that the exchange rate of the United States Dollar to the foreign currency is constantly changing. Now all of the sudden that dinner that I had planned for 30 euros, which originally was going to cost me 54 USD will now coast me 55 USD! 

On a small scale I think we can all agree that it will not have that much of an effect. However, what if we were going to stay for a long time, or were planning a stay in a high-end boutique hotel? That 1.8% change that I mentioned above could start to make a difference once the scope of the spending gets larger. 

*Purpose

The goal of this application is to allow for users to budget trips to foreign countries while getting real-time information about the exchange rate of that country's currency to the US Dollar, thus allowing the user to make an informed decision about when to exchange their currency.

*Video Demonstration
https://www.youtube.com/watch?v=IqXq84IiZ14

*Instructions

This repo serves as the backend for the companion repo https://github.com/kennja05/trip-tracker-fe

    1) Setup
        a) Clone down this repo, then run the command 'cd trip-tracker-be'
        b) Obtain the basic plan API key from fixer.io (feel free to message me and I would be happy to share mine)
        c) Run the command 'bundle install'
        d) In line 6 of rate_getter.rb replace "ENV['exchangeRateApiKey']" with your API key
        e) Run the following commands in your terminal in order
            i) rails db:migrate
            ii) rails db:seed
            iii) whenever --update-crontab

    2) Usage
        a) Run the command 'rails server' or 'rails s' in the terminal
        b) Locate the front end at https://github.com/kennja05/trip-tracker-fe and follow the steps listed there to complete setup of the application
