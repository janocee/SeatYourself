class ReservationsController < ApplicationController

  before_filter :load_restaurant
  #so that there's always a product loaded
  before_filter :ensure_logged_in, :only => [:show, :create, :show, :update, :destroy]
  #only ensure logged in for the methods in the hash.

  def index
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = @restaurant.reservations.new
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user_id = current_user.id

    # Check out this article on [.build](http://stackoverflow.com/questions/783584/ruby-on-rails-how-do-i-use-the-active-record-build-method-in-a-belongs-to-rel)
    # You could use a longer alternate syntax if it makes more sense to you
    #
    # @reservation = reservation.new(
    #   :comment    => params[:reservation][:comment],
    #   :product_id => @product.id,
    #   :user_id    => current_user.id
    # )

    if @reservation.save
      redirect_to restaurants_path, notice: 'reservation created successfully'
    else
      render :action => :show
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  private
  def reservation_params
    params.require(:reservation).permit(:comment, :restaurant_id, :party_number, :time_of_reso)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end