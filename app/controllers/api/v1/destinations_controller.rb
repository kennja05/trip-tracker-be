class Api::V1::DestinationsController < ApplicationController

    def index
        destinations = Destination.all 
        render json: destinations
    end 

    def show
        destination = Destination.find(params['id'])
        render json: destination, include: :values
    end 

    def topDestinations 
        topDestinations = Destination.all.sort_by {|destination| destination.trips.count}.reverse.slice(0,10)
        render json: topDestinations, include: [:trips, :currencies, :values]
    end

    def orderedDestinations
        topDestinations = Destination.all.sort_by {|destination| destination.trips.count}.reverse
        render json: topDestinations, include: [:trips, :currencies, :values]
    end 



end
