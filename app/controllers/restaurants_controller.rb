class RestaurantsController < ApplicationController
  before_action :load_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  private
    def load_restaurant
      @restaurant = Restaurant.find params[:id]
    end

    def restaurant_param
      params.require(:restaurant).permit(:name, :id, :category_id, :owner_id, :address)
    end
end
