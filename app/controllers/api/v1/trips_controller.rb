class Api::V1::TripsController < ApplicationController

    def index
        trips = Trip.all 
        render json: trips, include: :destination
    end 

    def show
        trip = Trip.find(params['id'])
        render json: trip , include: [:destination, :user]
    end 

    def create 
        trip = Trip.new(tripParams)
        if trip.save
            render json: trip
        else
            byebug
        end
    end

    private

    def tripParams
        params.require(:trip).permit(:start_date, :end_date, :destination_id, :user_id)
    end 

end
