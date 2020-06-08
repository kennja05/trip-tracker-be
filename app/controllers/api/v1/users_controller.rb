class Api::V1::UsersController < ApplicationController

    def index
        users = User.all 
        render json: users
    end 

    def login
        user = User.find_by(username: params['username'])
        if !user
            render json: nil
        else
            if user.password_digest === (params['password_digest'])
                render json: user
            else
                render json: nil
            end
        end
    end 


    def show
        user = User.find(params['id'])
        render json: user
    end 
 
    def create 
        user = User.new(userParams)
        if user.save
            render json: user
        else  
            render json: {'errors' => user.errors.full_messages} 
        end
    end

    def userTrips
        user = User.find(params['id'])
        myTrips = Trip.all.where(user_id: user.id).sort_by {|trip| trip.start_date}
        render json: myTrips, include: [:destination, :values]
    end 

    private 

    def userParams
        params.require(:user).permit(:username, :password_digest, :phone)
    end 

end
