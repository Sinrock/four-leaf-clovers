class SessionsController < ApplicationController

    def welcome
    end

    def new 
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user.try(:authenticate, params[:user][:password])
        #if @user && @user.authenticate(params[:user][password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Invalid information entered, please try again."
            redirect_to login_path
        end
    end

    #if @user.save
     #   session[:user.id] = @user.id
     #   redirect_to user_path(@user)

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
end

#


#def create
#    u = User.find_by_email(params[:email])
#    if u && u.authenticate(params[:password])
#        session[:user_id] = u.id
#        redirect_to user_path(u)
#    else
#        flash[:message] = "Incorrect email or password.  Please try again."
#        redirect_to '/login'
#    end
#end