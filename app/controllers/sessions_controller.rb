class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    def welcome
    end

    def new 
    end

    def create
        @user = User.find_or_create_from_auth_hash(auth_hash)
        self.current_user = @user
        redirect_to '/'
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def googleAuth
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          access_token = auth
          u.google_token = auth.credentials.token
          refresh_token = auth.credentials.refresh_token
          u.google_refresh_token = refresh_token if refresh_token.present?
          u.password = SecureRandom.urlsafe_base64
       end

       if @user.valid?
        session[:user_id] = @user.id
        redirect_to user_path(@user)
       else
        flash[:error] = "Credentials Error"
        redirect_to login_path
       end
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

    private

    def auth
        request.env['onmiauth.auth']
    end
end