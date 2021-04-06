class PostsController < ApplicationController
  before_action :redirect_if_not_logged_in

    def index
    end
    
    def show
        @post = Post.find(params[:id])
      end
end
