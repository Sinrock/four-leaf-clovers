class SessionsController < ApplicationController

    def welcome
    end

    def new 
    end

    def create
        u = User.find_by_email(params[:email])
        if u && u.authenticate(params[:password])
            session[:user_id] = u.id
            redirect_to user_path(u)
        else
            flash[:message] = "Incorrect email or password.  Please try again."
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/login'
    end
end
