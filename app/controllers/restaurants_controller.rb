class RestaurantsController < ApplicationController
    before_action :require_logged_in
    @restaurants = Restaurant.all
    def index
        @restaurants = Restaurant.all
    end
end
