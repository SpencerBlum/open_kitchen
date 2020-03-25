class CommentsController < ApplicationController

    
    def new 
        @comment = Comment.new
        @post = Post.find(params[:id])
    end


    def create
        @post = Post.find(params[:id])
        @comment = Comment.new(message: params[:comment][:message], user_id: session[:user_id], post_id: @post.id )
        @comment.save
        redirect_to posts_path
    end

    def edit
        # @post = Post.find(params[:id])
        @comment = Comment.find(params[:id])
        # byebug
    end
    def update
        # @post = Post.find(params[:id])
        @comment = Comment.find(params[:id])
        @comment.update(message: params[:comment][:message], user_id: @comment.user_id, post_id: @comment.post_id)
        redirect_to posts_path
    end

    # private

    # def comment_params
    #     params.require(:comment).permit(:message, :user_id)
    #   end


end