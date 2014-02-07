class ReservationsController < ApplicationController

	def index
		@reservations = Reservation.all
	end

	def show
		@reservation = Reservation.find(params[:id]
	end

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(reso_params)

		if @reservation.save
			redirect_to reservations_url
		else
			render :new
		end
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def update
		@reservation = Reservation.find(params[:id])

		if @reservation.update_attributes(reso_params)
			redirect_to reservation_path(@reservation)
		else
			render :edit
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to reservations_path
	end

	private
	def reso_params
		params.require(:reso).permit(:party_number, :time_of_reso)
	end
end
