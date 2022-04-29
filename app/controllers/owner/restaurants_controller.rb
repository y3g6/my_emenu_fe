class Owner::RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :only_owner, only: [:edit, :update, :destory]
  before_action :load_restaurant, only: [:show, :edit, :update, :destory]

  def index
    @restaurants = current_user.restaurants
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_param)
    if @restaurant.save
      redirect_to owner_restaurant_path(@restaurant.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    real_owner(@restaurant)
  end

  def update
    real_owner(@restaurant)
    if @restaurant.update(restaurant_param)
      redirect_to owner_restaurant_path(@restaurant.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    real_owner(@restaurant)
    @restaurant.destroy
    redirect_to restuaurants_path
  end

  private
    def load_restaurant
      @restaurant = Restaurant.find params[:id]
    end

    def only_owner
      unless current_user.owner?
        redirect_to root_path
        return
      end
    end

    def real_owner(restaurant)
      unless restaurant.owner_id == current_user.id
        redirect_to root_path
        return
      end
    end

    def restaurant_param
      params.require(:restaurant).permit(
        :name, :id, :category_id, :address, :profile,
        :cover, images: [])
    end
end
