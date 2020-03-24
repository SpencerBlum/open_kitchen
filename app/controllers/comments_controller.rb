class CommentsController < ApplicationController

    
    def new 
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(message: params[:comment][:message], user_id: session[:user_id])
        byebug
        redirect_to posts_path
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment.find(params[:id])
        @comment.update()
        redirect_to posts_path
    end

    # private

    # def comment_params
    #     params.require(:comment).permit(:message, :user_id)
    #   end


end