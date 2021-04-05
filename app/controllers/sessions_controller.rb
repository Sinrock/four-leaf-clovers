class SessionsController < ApplicationController

    def welcome
    end

    def new 
    end

    def create
      @user = User.find_by(email: params[:user][:email])
        if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Invalid information entered, please try again."
            redirect_to '/login'
        end
    end
    
    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def current_user
    end

    #def current_user
    #@current_user ||= User.find_by(id: session[:user])
  #end

end