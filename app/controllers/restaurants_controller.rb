class RestaurantsController < ApplicationController
  before_action :load_restaurant, only: [:show, :edit, :update, :destory]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_param)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_param)
      redirect_to restaurant_path(@restaurant.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    load_restaurant
    @restaurant.destroy
    redirect_to restuaurants_path
  end

  private
    def load_restaurant
      @restaurant = Restaurant.find params[:id]
    end

    def restaurant_param
      params.require(:restaurant).permit(:name, :id, :category_id, :owner_id, :address)
    end
end
