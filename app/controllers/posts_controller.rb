class PostsController < ApplicationController
    before_action :require_logged_in

    def index
        @posts = Post.all
    end





end
