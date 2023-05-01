class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    render json: serializer
  end

  def show
      render json: { restaurant: @restaurant }
    end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render json: serializer, status: :created
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  def update
    if restaurant.update(restaurant_params)
      render json: serializer
    else
      render json: serializer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    restaurant.destroy
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :city, :photo)
  end

  def restaurant
    Restaurant.find(params[:id])
  end

  def serializer
    RestaurantSerializer.new(@restaurants).serializable_hash.to_json
  end
end
