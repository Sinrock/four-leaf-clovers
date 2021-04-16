class TopicsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @comments = Comment.all
    end
    
    def new
        @topic = Topic.new
      end
  
      def create
        @topic = Topic.new(topic_params)
        if @topic.save
          redirect_to '/topics'
        else
            flash[:error] = "That topic already exists, silly goose!"
          render :new
        end
  
      end


    def show
    end

    private
    def topic_params
        params.require(:topic).permit(:user_id, :topic_id, :post_id, :topic, :title)
        #@topic_id = Topic.find_by(title: params[:title])
      end
end
