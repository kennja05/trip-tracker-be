class Api::V1::DestinationsController < ApplicationController

    def index
        destinations = Destination.all 
        render json: destinations
    end 

    def show
        destination = Destination.find(params['id'])
        render json: destination, include: [:currencies, :values]
    end 

    def topDestinations 
        topDestinations = Destination.all.sort_by {|destination| destination.trips.count}.reverse.slice(0,5)
        render json: topDestinations, include: :trips
    end



end
