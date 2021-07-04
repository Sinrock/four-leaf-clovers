class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    
    include ApplicationHelper

    helper_method :current_user, :logged_in?, :redirect_if_not_logged_in, :can_edit  #now I can use these helper methods in the views as well, hot dog!

    def after_sign_in_path_for(resource)
        request.env['omniauth.origin'] || root_path
    end

    private
    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end

    def can_edit(post)
        post.user == current_user
    end
end
