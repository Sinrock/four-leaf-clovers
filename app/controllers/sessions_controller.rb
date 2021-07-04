class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    def welcome
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def new 
    end

    def create
        @user = User.find_or_create_from_auth_hash(auth_hash)
        self.current_user = @user
        redirect_to '/'
      end
    
    
    #def create
    #  user = User.find_by(email: params[:user][:email])
    #    if user && user.authenticate(params[:user][:password])
    #    #if user.try(:authenticate, params[:user][:password])
    #        session[:user_id] = user.id
    #        redirect_to user_path(user)
    #    else
    #        flash[:error] = "Hmmm, something isn't quite right with that information, please try again."
    #        redirect_to '/login'
    #    end
    #end

    protected

    def auth_hash
        request.env['onmiauth.auth']
    end
end
