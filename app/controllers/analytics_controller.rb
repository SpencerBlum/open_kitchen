class AnalyticsController < ApplicationController
    before_action :require_logged_in

    def index
        @posts = Post.all
        @comments = Comment.all
        @users = User.all
        @restaurants = Restaurant.all
    end





end