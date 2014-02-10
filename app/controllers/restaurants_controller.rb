class RestaurantsController < ApplicationController

	before_filter :ensure_logged_in, :only => [:show]
	#only ensure logged in for show
	def index
		@restaurants = Restaurant.all
		@restaurants = Restaurant.search(params[:search])

		# redirect_to restaurants_url, :notice => "Unable to find Restaurant"
	end

	def show
		@restaurant = Restaurant.find(params[:id])

		if current_user
			@reservation = @restaurant.reservations.build
		end
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			redirect_to restaurants_url
		else
			render :new
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update_attributes(restaurant_params)
			redirect_to restaurant_path(@restaurant)
		else
			render :edit
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy

		redirect_to restaurants_path
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :num_of_seats, :address, :phone_number, :url, :description, :category, :open_at, :close_at)
	end

end