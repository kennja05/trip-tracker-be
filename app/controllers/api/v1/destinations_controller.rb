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
        topDestinations = Destination.all.sort_by {|destination| destination.trips.count}.reverse.slice(0,20)
        render json: topDestinations, include: [:trips, :values, :users]
    end

    def orderedDestinations
        topDestinations = Destination.all.sort_by {|destination| destination.trips.count}.reverse.slice(params[:index].to_i, params[:index].to_i + 50)
        render json: topDestinations, include: [:trips, :values, :users]
    end 

end