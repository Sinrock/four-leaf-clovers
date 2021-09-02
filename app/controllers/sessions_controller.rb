class SessionsController < ApplicationController

    def welcome
    end

    def new 
    end

    def omniauth
        @user = User.create_from_omniauth(auth)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to users_path
        else
            flash[:message] = @user.errors.full_messages.join(", ")
            redirect_to users_path
        end
    end
    
    #def googleAuth
    #    @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #      u.user_name = auth['info']['name']
    #      u.email = auth['info']['email']
    #      access_token = auth
    #      u.google_token = auth.credentials.token
    #      refresh_token = auth.credentials.refresh_token
    #      u.google_refresh_token = refresh_token if refresh_token.present?
    #      u.password = SecureRandom.urlsafe_base64
    #   end

    #   if @user.valid?
    #    session[:user_id] = @user.id
    #    redirect_to user_path(@user)
    #   else
    #    flash[:error] = "Credentials Error"
    #    redirect_to login_path
    #   end
    #end

    def create
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Invalid credentials. Please try again."
            redirect_to '/login', alert: "Invalid credentials. Please try again."
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
    
    private

    def auth
        request.env['onmiauth.auth']
    end
end