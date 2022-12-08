class SessionsController < ApplicationController
    def create
        user = User.find_or_create_by(username: params[:username])
        session[:user_id] = user.id
        render json: user
    end

    def destroy
        user = User.find_by(id:session[:user_id])
        session.delete :user_id
        head :no_content
    end
end
