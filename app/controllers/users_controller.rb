class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(reso_params)

		if @user.save
			redirect_to reservations_url
		else
			render :new
		end
	end

	private
	def reso_params
		params.require(:user).permit(:name, :username, :password, :password_confirmation, :email)
	end


end
