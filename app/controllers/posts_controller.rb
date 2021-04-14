class PostsController < ApplicationController
  before_action :redirect_if_not_logged_in

    def index
    end
    
    def show
        @post = Post.find(params[:id])
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to posts_path
      else
        render :new
      end

    end

    private

    def post_params
      params.require(:post).permit(:title, :body, :user_id, :topic_id, :post_id, :topic)
      @topic_id = Topic.find_by(title: params[:title])
    end
end
