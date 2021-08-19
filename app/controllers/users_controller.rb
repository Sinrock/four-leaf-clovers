class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def index
    end

def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
     unless user
         user = User.create(name: data['name'],
            email: data['email'],
            password: Devise.friendly_token[0,20]
         )
     end
    user
end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        #redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end

  private

    def user_params
      params.require(:user).permit(:user_name, :password, :email, :first_name, :last_name, :affected_person, :location)
    end

end
