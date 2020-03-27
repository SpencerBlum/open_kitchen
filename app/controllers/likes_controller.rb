
class LikesController < ApplicationController


    def new
        byebug
    end

    def show
        byebug
    end
    def create
        byebug
        @post.likes.where(user_id: current_user.id).first_or_create
        redirect_to posts_path
      end
    
    
    
      private
    
        def set_post
    
          @post = Post.find(params[:post_id])
    
        end
end