class Api::V1::DestinationsController < ApplicationController

    def index
        destinations = Destination.all 
        render json: destinations
    end 

    def show
        destination = Destination.find(params['id'])
        render json: destination
    end 

    def topDestinations 
        topDestinations = Destination.all.sort_by {|destination| destination.trips.count}.reverse.slice(0,20)
        render json: topDestinations, include: [:trips]
    end

    def orderedDestinations
        topDestinations = Destination.all.sort_by {|destination| destination.trips.count}.reverse
        render json: topDestinations, except: [:created_at, :updated_at, :image]
    end 

end