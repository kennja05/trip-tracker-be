class Api::V1::UsersController < ApplicationController

    def index
        users = User.all 
        render json: users
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
            render json: {errors: user.errors.full_messages} 
        end
    end

    def userTrips
        user = User.find(params['id'])
        myTrips = Trip.all.where(user_id: user.id)
        render json: myTrips, include: [:destination, :values]
    end 

    private 

    def userParams
        params.require(:user).permit(:name, :username, :password, :image, :phone, :email)
    end 

end
