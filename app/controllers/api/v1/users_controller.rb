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
        user = User.create(userParams)
        byebug
    end

    private 

    def userParams
        params.require(:user).permit(:name, :username, :password, :image, :phone, :email)
    end 

end
