class SessionsController < ApplicationController

    def welcome
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def new 
    end

    def create
      user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
        #if user.try(:authenticate, params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:error] = "Hmmm, something isn't quite right with that information, please try again."
            redirect_to '/login'
        end
    end
end
