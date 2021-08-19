class PostsController < ApplicationController
  #before_action :redirect_if_not_logged_in

    def index
      @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
    end

    def new
      @post = Post.new
    end

    def edit
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to posts_path
      else
        flash[:error] = "Post could not be created. Please try again!"
        render :new
      end
    end
    
    private

    def post_params
      params.require(:post).permit(:title, :body,:topic_title, :user_id)
    end
end
