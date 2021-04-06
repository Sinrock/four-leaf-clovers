class CommentsController < ApplicationController
    def index
    end

    def show
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to @comment
        else
            render :new
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end

end
